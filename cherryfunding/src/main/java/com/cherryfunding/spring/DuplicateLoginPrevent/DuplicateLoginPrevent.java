package com.cherryfunding.spring.DuplicateLoginPrevent;


import java.util.Enumeration;
import java.util.Hashtable;
import java.util.Iterator;
import java.util.Map;

import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionBindingEvent;
import javax.servlet.http.HttpSessionBindingListener;

import org.springframework.stereotype.Component;

@Component("DuplicateLoginPrevent")
public class DuplicateLoginPrevent implements HttpSessionBindingListener{
    
    /** 로그인 유저 관련 해쉬 테이블 **/
    private static Hashtable userList = new Hashtable();
    
 
       /**
        * 해당 아이디가 로그인 되어있는지
        * @param sessionID
        * @return
        */
       public boolean isLogin(String sessionID){
                     boolean isLogin = false;
                     Enumeration e = userList.keys();
                     String key = "";
                     while(e.hasMoreElements()){
                                  key = (String)e.nextElement();
                                  if(sessionID.equals(key)){
                                               isLogin = true;
                                  }
                     }
                     return isLogin;
       }
 
       /**
        * 해당 아이디가 사용중인지
        * @param userID
        * @return
        */
       public boolean isUsing(String userID, HttpSession session){
                     boolean isUsing = false;
                     Enumeration e = userList.keys();
                     String key = "";
                     while(e.hasMoreElements()){
                          key = (String)e.nextElement();
                          if(!key.equals(session.getId()) && userID.equals(userList.get(key))){
                              isUsing = true;         
                          }
                     }
                     System.out.println("is Using " + isUsing);
                     return isUsing;
       }
       
       
       /**
        * 세션 생성 , user 저장
        * @param session
        * @param userID
        */
       public void setSession(HttpSession session, String userID){
                       userList.put(session.getId(), userID);
                     //session.setAttribute("login", this.getInstance());
                     
                    System.out.println("user list " + userList);
       }
       
       /**
        * 세션 생성될때
        */
        public void valueBound(HttpSessionBindingEvent event) {
            // TODO Auto-generated method stub
            
        }
        
        /**
         * 세션 끊길 때
         */
        public void valueUnbound(HttpSessionBindingEvent event) {
            // TODO Auto-generated method stub
            
            userList.remove(event.getSession().getId());
        }
 
        /**
         * 중복 로그인시 이전 로그인 세션 날리기
         * @param session
         */
        public void removeLoginInfo(HttpSession session, String userID){
            
            Iterator<Map.Entry<String, String>> itr = userList.entrySet().iterator();
            
            String sessionId = session.getId();
            
            while(itr.hasNext()){
                Map.Entry<String, String> data = itr.next();
                System.out.println("data =====> " + data);
                if(data.getValue().trim().equals(userID)){
                    System.out.println(data);
                    userList.remove(data.getKey());            // 로그인 해지할 사용자 세션 추가 이후 interceptor에서 확인 후 로그 아웃으로 보냄
                    System.out.println("user list " + userList);
                    return;
                }
                
            } 
        }        
            
        /**
         * 금지 사용자 목록 가져오기
         * @return
         */
        public Hashtable getUserList(){
            return userList;
        }        
}
