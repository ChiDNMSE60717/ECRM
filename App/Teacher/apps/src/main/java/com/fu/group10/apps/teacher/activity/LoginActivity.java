package com.fu.group10.apps.teacher.activity;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import android.os.AsyncTask;
import android.os.Bundle;
import android.support.v7.app.ActionBarActivity;
import android.telephony.SmsManager;
import android.text.TextUtils;
import android.util.Log;
import android.view.KeyEvent;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.inputmethod.EditorInfo;
import android.widget.*;
import com.fu.group10.apps.teacher.model.ClassroomInfo;
import com.fu.group10.apps.teacher.model.User;
import com.fu.group10.apps.teacher.R;
import com.fu.group10.apps.teacher.service.RegisterActivity;
import com.fu.group10.apps.teacher.service.ShareExternalServer;
import com.fu.group10.apps.teacher.utils.Constants;
import com.fu.group10.apps.teacher.utils.NetworkUtils;
import com.fu.group10.apps.teacher.utils.ParseUtils;
import com.fu.group10.apps.teacher.utils.RequestSender;
import com.google.android.gms.gcm.GoogleCloudMessaging;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;


/**
 * Created by QuangTV on 5/30/2015.
 */
public class LoginActivity  extends ActionBarActivity {

    private static final String result ="";
    private static final String defaultPassword = "123ecrm";
    private AutoCompleteTextView usernameTextView;
    private EditText passwordTextView;
    Context context;

    private static User user;

    GoogleCloudMessaging gcm;

    public static final String REG_ID = "regId";
    private static final String APP_VERSION = "appVersion";

    static final String TAG = "Notify Activity";


    ShareExternalServer appUtil;
    String regId;
    AsyncTask<Void, Void, String> shareRegidTask;


    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_login);
        context = getApplicationContext();

        usernameTextView = (AutoCompleteTextView) findViewById(R.id.username);

        passwordTextView = (EditText) findViewById(R.id.password);
        passwordTextView.setOnEditorActionListener(new TextView.OnEditorActionListener() {
            @Override
            public boolean onEditorAction(TextView textView, int id, KeyEvent keyEvent) {
                if (id == EditorInfo.IME_NULL) {
                   initLogin();
                    return true;
                }
                return false;
            }
        });

        Button loginButton = (Button) findViewById(R.id.sign_in_button);
        loginButton.setOnClickListener(new OnClickListener() {
            @Override
            public void onClick(View view) {
                //sendSMS();
                initLogin();
            }
        });



    }


    /**
     * Validate Login form and authenticate.
     */
    public void initLogin() {


        usernameTextView.setError(null);
        passwordTextView.setError(null);

        String username = usernameTextView.getText().toString();
        String password = passwordTextView.getText().toString();

        boolean cancelLogin = false;
        View focusView = null;

        if (TextUtils.isEmpty(password) && !isPasswordValid(password)) {
            passwordTextView.setError(getString(R.string.invalid_password));
            focusView = passwordTextView;
            cancelLogin = true;
        }

        if (TextUtils.isEmpty(username) && !isUsernameValid(username)) {
            usernameTextView.setError(getString(R.string.field_required));
            focusView = usernameTextView;
            cancelLogin = true;
        }

        if (cancelLogin) {
            // error in login
            focusView.requestFocus();
        } else {
            // show progress spinner, and start background task to login
            //Map<String, String> params = new HashMap<String, String>();
            //params.put("username", username);
            //params.put("password", password);
            String url = Constants.API_LOGIN + "?username="+username+"&password="+password;
            RequestSender sender = new RequestSender();
            sender.start(url, new RequestSender.IRequestSenderComplete() {
                @Override
                public void onRequestComplete(String result) {
                    user = ParseUtils.parseUserJson(result);
                    if (user != null ) {
                        if (user.getRole().equalsIgnoreCase("Teacher") && user.getLastLogin() == null ) {
                            firstLogin(user.getPassword());
                        } else {
                            if (TextUtils.isEmpty(regId)) {
                                regId = registerGCM();
                                Log.d("RegisterActivity", "GCM RegId: " + regId);
                            } else {
                                Toast.makeText(getApplicationContext(),
                                        "Already Registered with GCM Server!",
                                        Toast.LENGTH_LONG).show();
                            }
                            registerWithServer(user.getUsername());
                            openMainActivity();
                        }
                    } else {
                        Toast.makeText(LoginActivity.this, "Username or password are incorrect!", Toast.LENGTH_LONG).show();
                    }

                }

            });






        }
    }

    private boolean isPasswordValid(String password) {
        //add your own logic
        return password.length() > 4 || password.length() < 20;
    }
    private boolean isUsernameValid(String username) {
        return username.length() > 6 || username.length() < 20;
    }




    void openMainActivity() {
        Intent intent = new Intent(this, RegisterActivity.class);
        //intent.putParcelableArrayListExtra("listClass", listClassroom);
        intent.putExtra("username", user.getUsername());
        startActivity(intent);
        finish();
    }

    public void firstLogin(String password) {
        Intent intent = new Intent(this, ChangePasswordActivity.class);
        intent.putExtra("current_password", password);
        startActivity(intent);
        finish();
    }

    public String registerGCM() {

        gcm = GoogleCloudMessaging.getInstance(this);
        regId = getRegistrationId(context);

        if (TextUtils.isEmpty(regId)) {

            registerInBackground();

            Log.d("RegisterActivity",
                    "registerGCM - successfully registered with GCM server - regId: "
                            + regId);
        } else {
            Toast.makeText(getApplicationContext(),
                    "RegId already available. RegId: " + regId,
                    Toast.LENGTH_LONG).show();
        }
        return regId;
    }

    private String getRegistrationId(Context context) {
        final SharedPreferences prefs = getSharedPreferences(
                NotifyActivity.class.getSimpleName(), Context.MODE_PRIVATE);
        String registrationId = prefs.getString(REG_ID, "");
        if (registrationId.isEmpty()) {
            Log.i(TAG, "Registration not found.");
            return "";
        }
        int registeredVersion = prefs.getInt(APP_VERSION, Integer.MIN_VALUE);
        int currentVersion = getAppVersion(context);
        if (registeredVersion != currentVersion) {
            Log.i(TAG, "App version changed.");
            return "";
        }
        return registrationId;
    }

    private static int getAppVersion(Context context) {
        try {
            PackageInfo packageInfo = context.getPackageManager()
                    .getPackageInfo(context.getPackageName(), 0);
            return packageInfo.versionCode;
        } catch (PackageManager.NameNotFoundException e) {
            Log.d("RegisterActivity",
                    "I never expected this! Going down, going down!" + e);
            throw new RuntimeException(e);
        }
    }

    private void registerInBackground() {
        new AsyncTask<Void, Void, String>() {
            @Override
            protected String doInBackground(Void... params) {
                String msg = "";
                try {
                    if (gcm == null) {
                        gcm = GoogleCloudMessaging.getInstance(context);
                    }
                    regId = gcm.register(Constants.GOOGLE_PROJECT_ID);
                    Log.d("RegisterActivity", "registerInBackground - regId: "
                            + regId);
                    msg = "Device registered, registration ID=" + regId;

                    storeRegistrationId(context, regId);
                } catch (IOException ex) {
                    msg = "Error :" + ex.getMessage();
                    Log.d("RegisterActivity", "Error: " + msg);
                }
                Log.d("RegisterActivity", "AsyncTask completed: " + msg);
                return msg;
            }

            @Override
            protected void onPostExecute(String msg) {
                Toast.makeText(getApplicationContext(),
                        "Registered with GCM Server." + msg, Toast.LENGTH_LONG)
                        .show();
            }
        }.execute(null, null, null);
    }

    private void storeRegistrationId(Context context, String regId) {
        final SharedPreferences prefs = getSharedPreferences(
                NotifyActivity.class.getSimpleName(), Context.MODE_PRIVATE);
        int appVersion = getAppVersion(context);
        Log.i(TAG, "Saving regId on app version " + appVersion);
        SharedPreferences.Editor editor = prefs.edit();
        editor.putString(REG_ID, regId);
        editor.putInt(APP_VERSION, appVersion);
        editor.commit();
    }

    public void registerWithServer(final String username) {
        appUtil = new ShareExternalServer();


        Log.d("MainActivity", "regId: " + regId);

        final Context context = this;
        shareRegidTask = new AsyncTask<Void, Void, String>() {
            @Override
            protected String doInBackground(Void... params) {
                String result = appUtil.shareRegIdWithAppServer(context, regId, username);
                return result;
            }

            @Override
            protected void onPostExecute(String result) {
                shareRegidTask = null;
                Toast.makeText(getApplicationContext(), result,
                        Toast.LENGTH_LONG).show();
            }

        };
        shareRegidTask.execute(null, null, null);


    }



}
