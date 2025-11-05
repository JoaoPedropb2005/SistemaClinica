/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.mycompany.sistemadeclinica.controllers;

import com.mycompany.sistemadeclinica.negocio.Paciente;
import com.mycompany.sistemadeclinica.repositorios.RepositorioPaciente;
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
@WebServlet(name = "PacienteServlet", urlPatterns = {"/PacienteServlet"})
public class PacienteServlet extends HttpServlet {

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
            
            String cpf = request.getParameter("codigo");
            
            RepositorioPaciente.deletar(cpf);
            
            request.getSession().setAttribute("msg", "Paciente deletado com sucesso!");
            
            response.sendRedirect("Pacientes");
            
            return;
        }
        
        if(op!=null && op.equals("alterar")){
            
            Paciente p = RepositorioPaciente.
                    ler(request.getParameter("cpf"));
            
            request.setAttribute("Paciente", p);
            
            //getServletContext().getRequestDispatcher("/WEB-INF/cadastroservico.jsp")
            //        .forward(request, response);
            
            getServletContext().getRequestDispatcher("/cadastropaciente.jsp")
                   .forward(request, response);
            
            return;
        
        }
        
        
        List<Paciente> pacientes = RepositorioPaciente.lerTudo();
        
        HttpSession session = request.getSession();
        
        session.setAttribute("pacientes", pacientes);
        
        response.sendRedirect("pacientes.jsp");
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
        
        String cpf = request.getParameter("cpf");
        String nome = request.getParameter("nome");
        String endereco = request.getParameter("endereço");
        String contato = request.getParameter("contato");
        String planoSaude = request.getParameter("planoSaude");
        
        Paciente p = new Paciente();
        p.setCpf(cpf);
        p.setNome(nome);
        p.setEndereco(endereco);
        p.setContato(contato);
        p.setPlanoSaude(planoSaude);
        
        if(op!=null && op.equals("alterar")){
            RepositorioPaciente.atualizar(p);
            request.getSession().setAttribute("msg","Paciente Atualizado com Sucesso!");
        }else{
            RepositorioPaciente.inserir(p);
            request.getSession().setAttribute("msg","Paciente Cadastrado com Sucesso!");
        }
        
        
        
        response.sendRedirect("Pacientes");
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
