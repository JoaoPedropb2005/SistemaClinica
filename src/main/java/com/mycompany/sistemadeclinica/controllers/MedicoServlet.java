/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.mycompany.sistemadeclinica.controllers;

import com.mycompany.sistemadeclinica.negocio.Medico;
import com.mycompany.sistemadeclinica.repositorios.RepositorioMedico;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;

/**
 *
 * @author jppb2
 */
@WebServlet(name = "MedicoServlet", urlPatterns = {"/MedicoServlet"})
public class MedicoServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    
    /*
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
    //        out.println("<!DOCTYPE html>");
    //        out.println("<html>");
    //        out.println("<head>");
    //        out.println("<title>Servlet PacienteServlet</title>");
    //        out.println("</head>");
    //        out.println("<body>");
    //        out.println("<h1>Servlet PacienteServlet at " + request.getContextPath() + "</h1>");
    //        out.println("</body>");
    //        out.println("</html>");
    //    }
    //} 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //processRequest(request, response);
         String op = request.getParameter("op");
        
        if(op != null && op.equals("deletar")){
            
            String crm = request.getParameter("crm");
            
            RepositorioMedico.deletar(crm);
            
            request.getSession().setAttribute("msg", "Medico deletado com sucesso!");
            
            response.sendRedirect("MedicoServlet");
            
            return;
        }
        
        if(op!=null && op.equals("alterar")){
            
            Medico m = RepositorioMedico.
                    ler(request.getParameter("crm"));
            
            request.setAttribute("medico", m);
            
            //getServletContext().getRequestDispatcher("/WEB-INF/cadastroservico.jsp")
            //        .forward(request, response);
            
            getServletContext().getRequestDispatcher("/cadastroMedico.jsp")
                   .forward(request, response);
            
            return;
        
        }
        
        
        List<Medico> medicos = RepositorioMedico.lerTudo();
        
        HttpSession session = request.getSession();
        
        session.setAttribute("medicos", medicos);
        
        response.sendRedirect("medicos.jsp");
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       // processRequest(request, response);
       String op = request.getParameter("op");
        
        String crm = request.getParameter("crm");
        String nome = request.getParameter("nome");
        String especialidade = request.getParameter("especialidade");
        String contato = request.getParameter("contato");
        
        Medico m = new Medico();
        m.setCrm(crm);
        m.setNome(nome);
        m.setEspecialidade(especialidade);
        m.setContato(contato);
        
        if(op!=null && op.equals("alterar")){
            RepositorioMedico.atualizar(m);
            request.getSession().setAttribute("msg","Medico Atualizado com Sucesso!");
        }else{
            RepositorioMedico.inserir(m);
            request.getSession().setAttribute("msg","Medico Cadastrado com Sucesso!");
        }
        
        
        
        response.sendRedirect("MedicoServlet");
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
