/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package sms.controllers.servlet;

import com.sun.jersey.api.client.Client;
import com.sun.jersey.api.client.ClientResponse;
import com.sun.jersey.api.client.WebResource;
import java.io.IOException; 
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.codehaus.jettison.json.JSONException;
import org.codehaus.jettison.json.JSONObject;

/**
 *
 * @author aadong
 */

@WebServlet("/messageController")
public class MessageController extends HttpServlet {
  
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException { 
        request.getRequestDispatcher("index.jsp").forward(request, response);  
    }
 
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
         
        try {
            String number = request.getParameter("number");
            String message = request.getParameter("message");

            Client  client = Client.create();
            WebResource webResource = client.resource("http://localhost:8084/Messaging/webresources/message/send"); 

            JSONObject msg = new JSONObject();
            msg.put("number", number);
            msg.put("message", message);

            String output = msg.toString();  
            ClientResponse webServiceReponse = webResource.type("application/json").post(ClientResponse.class, output);

        }catch (JSONException ex) {
            request.getSession().setAttribute("status", "Error occured!");
            response.getWriter().write("0");
        }    
        response.getWriter().write("1");
    } 
   
}
