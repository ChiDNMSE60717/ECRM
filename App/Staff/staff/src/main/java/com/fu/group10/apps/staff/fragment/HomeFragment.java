package com.fu.group10.apps.staff.fragment;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.os.Bundle;
import android.support.v4.app.Fragment;
import android.util.SparseBooleanArray;
import android.view.*;
import android.view.inputmethod.InputMethodManager;
import android.widget.*;
import com.fu.group10.apps.staff.DummyApplication;
import com.fu.group10.apps.staff.R;
import com.fu.group10.apps.staff.Utils.Constants;
import com.fu.group10.apps.staff.Utils.ParseUtils;
import com.fu.group10.apps.staff.Utils.RequestSender;
import com.fu.group10.apps.staff.Utils.Utils;
import com.fu.group10.apps.staff.activity.ResolveReportActivity;
import com.fu.group10.apps.staff.adapter.ListRoomAdapter;
import com.fu.group10.apps.staff.model.ReportInfo;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by QuangTV on 7/3/2015.
 */
public class HomeFragment extends Fragment {

    private ListView mListView;
    private ListRoomAdapter mAdapter;
    private String username;
    private List<ReportInfo> mRandomData = new ArrayList<ReportInfo>();
    private View emptyView;
    private Context context;
    private ProgressBar progressBar;
    private TextView emptyMessage;
    private String type = "new";


    public HomeFragment(){

    }

    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container,
                             Bundle savedInstanceState) {

        View rootView = inflater.inflate(R.layout.fragment_home, container, false);
        initListView(rootView);
        return rootView;
    }

    public void initListView(View rootView) {

        context = DummyApplication.getAppContext();
        emptyView = rootView.findViewById(R.id.empty_list);
        emptyMessage = (TextView) emptyView.findViewById(R.id.emptyMessage);
        progressBar = (ProgressBar) emptyView.findViewById(R.id.loadingImg);
        if (!Utils.isOnline()) {
            emptyMessage.setText(DummyApplication.getAppContext().getString(R.string.noConnection));
        } else {
            emptyMessage.setText(DummyApplication.getAppContext().getString(R.string.no_report_found));
        }

        this.mListView = (ListView) rootView.findViewById(R.id.lv_sample_list);
        mListView.setEmptyView(emptyView);
        getDummyData();


    }

    private void getDummyData(){

        String url = Constants.API_GET_REPORT + type;
        RequestSender sender = new RequestSender();
        sender.start(url, new RequestSender.IRequestSenderComplete() {
            @Override
            public void onRequestComplete(String result) {
                List<ReportInfo> classrooms = ParseUtils.parseReportFromJSON(result);
                mRandomData = classrooms;
                if (classrooms.size() > 0) {
                    progressBar.setVisibility(View.GONE);
                    emptyMessage.setVisibility(View.INVISIBLE);
                    setAdapter();
                    setMultiChoice();
                } else {
                    progressBar.setVisibility(View.GONE);
                    emptyMessage.setVisibility(View.VISIBLE);
                }

            }
        });
        //sender.start(url, new RequestSender.IRequestSenderComplete() {
        //String response = "[{'className': '103','classId' : 123,'timeFrom' : '18:40','timeTo' : '19:40'},{'className': '104','classId' : 124,'timeFrom' : '18:40','timeTo' : '19:40'},{'className': '105','classId' : 125,'timeFrom' : '18:40','timeTo' : '19:40'},{'className': '106',	'classId' : 123,'timeFrom' : '18:40','timeTo' : '19:40'}]";



    }

    public void setMultiChoice() {
        mListView.setChoiceMode(ListView.CHOICE_MODE_MULTIPLE_MODAL);
        mListView.setMultiChoiceModeListener(new AbsListView.MultiChoiceModeListener() {

            @Override
            public void onItemCheckedStateChanged(ActionMode mode,
                                                  int position, long id, boolean checked) {
                // Capture total checked items
                final int checkedCount = mListView.getCheckedItemCount();
                // Set the CAB title according to total checked items
                mode.setTitle(checkedCount + " báo cáo đã chọn");

                // Calls toggleSelection method from ListViewAdapter Class
                mAdapter.toggleSelection(position);
            }

            @Override
            public boolean onActionItemClicked(ActionMode mode, MenuItem item) {
                switch (item.getItemId()) {
                    case R.id.delete:
                        // Calls getSelectedIds method from ListViewAdapter Class
                        SparseBooleanArray selected = mAdapter
                                .getSelectedIds();
                        // Captures all selected ids with a loop
                        for (int i = (selected.size() - 1); i >= 0; i--) {
                            if (selected.valueAt(i)) {
                                ReportInfo selecteditem = (ReportInfo) mAdapter
                                        .getItem(selected.keyAt(i));
                                // Remove selected items following the ids
                                mAdapter.remove(selecteditem);
                            }
                        }
                        // Close CAB
                        mode.finish();
                        return true;
                    default:
                        return false;
                }
            }

            @Override
            public boolean onCreateActionMode(ActionMode mode, Menu menu) {
                mode.getMenuInflater().inflate(R.menu.activity_main, menu);
                return true;
            }

            @Override
            public void onDestroyActionMode(ActionMode mode) {
                // TODO Auto-generated method stub
                mAdapter.removeSelection();
            }

            @Override
            public boolean onPrepareActionMode(ActionMode mode, Menu menu) {
                // TODO Auto-generated method stub
                return false;
            }
        });
    }

    public void setAdapter()
    {

        this.mAdapter = new ListRoomAdapter(context,mRandomData, type);
        this.mListView.setAdapter(mAdapter);
        this.mListView.setOnItemClickListener(new AdapterView.OnItemClickListener() {
            @Override
            public void onItemClick(AdapterView<?> adapterView, View view, int i, long l) {
                ReportInfo report = mRandomData.get(i);
                openMap(report);
            }
        });
    }


    private void openMap(ReportInfo reportInfo) {
        Intent intent = new Intent(context, ResolveReportActivity.class);
        intent.putExtra("report", reportInfo);
        intent.putExtra("type", type);
        startActivityForResult(intent, 1);
    }

    public static void hideSoftKeyboard(Activity activity) {
        InputMethodManager inputMethodManager = (InputMethodManager)  activity.getSystemService(Activity.INPUT_METHOD_SERVICE);
        inputMethodManager.hideSoftInputFromWindow(activity.getCurrentFocus().getWindowToken(), 0);
    }
}
