package com.ecrm.Utils.socket;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by ChiDNMSE60717 on 6/16/2015.
 */
public class UserOnline {
    private String socketId;
    private String username;
    private int role;

    public UserOnline(){}

    public UserOnline(String socketId, String username, int role) {
        super();
        this.socketId = socketId;
        this.username = username;
        this.role = role;
    }

    public static UserOnline checkContainIn(List<UserOnline> list, String username, String socketId) {

        if(username == null) {
            for (UserOnline item: list) {
                if(item.getSocketId().equals(socketId)) {
                    return item;
                }
            }
        }

        for (UserOnline item: list) {
            if(item.getUsername().equals(username)) {
                return item;
            }
        }

        return null;
    }

    public static List<UserOnline> getUserByRole(List<UserOnline> list, int role){
        List<UserOnline> result = new ArrayList<UserOnline>();
        for (UserOnline user: list) {
            if(user.getRole() == role) {
                result.add(user);
            }
        }

        return result;
    }

    public String getSocketId() {
        return socketId;
    }

    public void setSocketId(String socketId) {
        this.socketId = socketId;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public int getRole() {
        return role;
    }

    public void setRole(int role) {
        this.role = role;
    }
}