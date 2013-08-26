/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package sms.controllers;

import java.io.File;
import java.io.IOException; 
import java.net.URL;
import javax.servlet.ServletException; 
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.io.FileUtils;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import sms.service.MetaTagReader;

/**
 *
 * @author aadong
 */ 
public class MetaTagReaderServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP
     * <code>GET</code> and
     * <code>POST</code> methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String url = request.getParameter("link");
        Document document = Jsoup.connect(url).userAgent("Mozilla").get();
        String responseURL = MetaTagReader.getMetaTag(document, "og:image");
        response.setContentType("text/plain");
        response.setCharacterEncoding("UTF-8");
        int lastIndexOf = responseURL.lastIndexOf("?");
        String finalURL = responseURL.substring(0, lastIndexOf); 
        File file = new File("resources/img/" + finalURL.substring(0, finalURL.lastIndexOf("/")));
        URL imgURL = new URL(finalURL);
        FileUtils.copyURLToFile(imgURL, file);
        response.getWriter().write(file.getPath());
 
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP
     * <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP
     * <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
