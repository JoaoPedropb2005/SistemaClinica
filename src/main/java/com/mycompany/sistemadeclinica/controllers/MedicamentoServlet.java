/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.mycompany.sistemadeclinica.controllers;

import com.mycompany.sistemadeclinica.negocio.Medicamento;
import com.mycompany.sistemadeclinica.repositorios.RepositorioMedicamento;
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
@WebServlet(name = "MedicamentoServlet", urlPatterns = {"/MedicamentoServlet"})
public class MedicamentoServlet extends HttpServlet {

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
            
            int codigo = Integer.parseInt(request.getParameter("codigo"));
            
            RepositorioMedicamento.deletar(codigo);
            
            request.getSession().setAttribute("msg", "Medicamento deletado com sucesso!");
            
            response.sendRedirect("MedicamentoServlet");
            
            return;
        }
        
        if(op!=null && op.equals("alterar")){
            
            int codigo = Integer.parseInt(request.getParameter("codigo"));
            
            Medicamento m = RepositorioMedicamento.
                    ler(codigo);
            
            request.setAttribute("medicamento", m);
            
            //getServletContext().getRequestDispatcher("/WEB-INF/cadastroservico.jsp")
            //        .forward(request, response);
            
            getServletContext().getRequestDispatcher("/cadastroMedicamento.jsp")
                   .forward(request, response);
            
            return;
        
        }
        
        
        List<Medicamento> medicamentos = RepositorioMedicamento.lerTudo();
        
        HttpSession session = request.getSession();
        
        session.setAttribute("medicamentos", medicamentos);
        
        response.sendRedirect("medicamentos.jsp");
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
        
        int codigo = Integer.parseInt(request.getParameter("codigo"));
        String nome = request.getParameter("nome");
        int dosagem = Integer.parseInt(request.getParameter("dosagem"));
        String tipoDosagem = request.getParameter("tipoDosagem");
        String observacao = request.getParameter("observacao");
        
        Medicamento m = new Medicamento();
        m.setCodigo(codigo);
        m.setNome(nome);
        m.setDosagem(dosagem);
        m.setTipoDosagem(tipoDosagem);
        m.setObservacao(observacao);
        
        if(op!=null && op.equals("alterar")){
            RepositorioMedicamento.atualizar(m);
            request.getSession().setAttribute("msg","Medicamento Atualizado com Sucesso!");
        }else{
            RepositorioMedicamento.inserir(m);
            request.getSession().setAttribute("msg","Medicamento Cadastrado com Sucesso!");
        }
        
        
        
        response.sendRedirect("MedicamentoServlet");
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
