package com.fu.group10.capstone.apps.teachermobileapp.activity;

import android.content.Intent;
import android.os.Bundle;
import android.support.v4.app.Fragment;
import android.support.v4.app.FragmentManager;
import android.support.v4.app.FragmentStatePagerAdapter;
import android.support.v4.view.ViewPager;
import android.support.v7.app.ActionBarActivity;
import android.view.Menu;
import android.view.MenuItem;

import com.fu.group10.capstone.apps.teachermobileapp.R;
import com.fu.group10.capstone.apps.teachermobileapp.fragment.ClassroomFragment;
import com.fu.group10.capstone.apps.teachermobileapp.fragment.EquipmentFragment;
import com.fu.group10.capstone.apps.teachermobileapp.fragment.GuideFragment;
import com.google.common.collect.Lists;
import github.chenupt.multiplemodel.viewpager.ModelPagerAdapter;
import github.chenupt.multiplemodel.viewpager.PagerModelManager;
import github.chenupt.springindicator.SpringIndicator;
import github.chenupt.springindicator.viewpager.ScrollerViewPager;
import it.neokree.materialtabs.MaterialTab;
import it.neokree.materialtabs.MaterialTabHost;
import it.neokree.materialtabs.MaterialTabListener;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by QuangTV on 6/15/2015.
 */
public class TestActivity extends ActionBarActivity implements MaterialTabListener{


    MaterialTabHost tabHost;
    ViewPager pager;
    ViewPagerAdapter adapter;
    List<String> listTiltes = new ArrayList<String>();

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        tabHost = (MaterialTabHost) findViewById(R.id.tabHost);
        pager = (ViewPager) findViewById(R.id.pager);
        generateTitle();

        // init view pager
        adapter = new ViewPagerAdapter(getSupportFragmentManager());
        pager.setAdapter(adapter);
        pager.setOnPageChangeListener(new ViewPager.SimpleOnPageChangeListener() {
            @Override
            public void onPageSelected(int position) {
                // when user do a swipe the selected tab change
                tabHost.setSelectedNavigationItem(position);

            }
        });

        // insert all tabs from pagerAdapter data
        for (int i = 0; i < 2; i++) {
            tabHost.addTab(
                    tabHost.newTab()
                            .setText(getTitles(i))
                            .setTabListener(this)
            );

        }
    }

    public void generateTitle() {
        listTiltes.add("Tổng Quát");
        listTiltes.add("Chi Tiết");
    }

    public String getTitles(int position) {
        return listTiltes.get(position);
    }

    @Override
    public void onTabSelected(MaterialTab tab) {
        pager.setCurrentItem(tab.getPosition());
    }

    @Override
    public void onTabReselected(MaterialTab tab) {

    }

    @Override
    public void onTabUnselected(MaterialTab tab) {

    }

    private class ViewPagerAdapter extends FragmentStatePagerAdapter {

        List<Fragment> fragmentList = new ArrayList<>();

        public ViewPagerAdapter(FragmentManager fm) {
            super(fm);
            addFragment();
        }
        public void addFragment() {
            fragmentList.add(new EquipmentFragment());
            fragmentList.add(new ClassroomFragment());
        }

        public Fragment getItem(int num) {
            return fragmentList.get(num);
        }

        @Override
        public int getCount() {
            return 2;
        }

        @Override
        public CharSequence getPageTitle(int position) {
            return "Tầng " + (position + 1);
        }

    }




    @Override
    public void onBackPressed() {
        Intent returnIntent = new Intent();
        setResult(RESULT_CANCELED, returnIntent);
        finish();
    }
}
