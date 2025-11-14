/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.mycompany.sistemadeclinica.controllers;

import com.mycompany.sistemadeclinica.negocio.Consulta;
import com.mycompany.sistemadeclinica.negocio.Medico;
import com.mycompany.sistemadeclinica.negocio.Paciente;
import com.mycompany.sistemadeclinica.repositorios.RepositorioConsultas;
import com.mycompany.sistemadeclinica.repositorios.RepositorioPaciente;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author jppb2
 */
@WebServlet(name = "ConsultaServlet", urlPatterns = {"/ConsultaServlet"})
public class ConsultaServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ConsultaServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ConsultaServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    
    /*
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //processRequest(request, response);
        String op = request.getParameter("op");
        
        if(op != null && op.equals("deletar")){
            
            int codigo = Integer.parseInt(request.getParameter("codigo"));
            
            RepositorioConsultas.deletar(codigo);
            
            request.getSession().setAttribute("msg", "Consulta deletada com sucesso!");
            
            response.sendRedirect("ConsultaServlet");
            
            return;
        }
        
        if(op!=null && op.equals("alterar")){
            
            int codigo = Integer.parseInt(request.getParameter("codigo"));
            
            Consulta c = RepositorioConsultas.
                    ler(codigo);
            
            request.setAttribute("Consulta", c);
            
            //getServletContext().getRequestDispatcher("/WEB-INF/cadastroservico.jsp")
            //        .forward(request, response);
            
           // getServletContext().getRequestDispatcher("/cadastroIndicadorExame.jsp")
             //      .forward(request, response);
            
            return;
        
        }
        
        
        List<IndicadorExame> indicadorexames = RepositorioIndicadorExame.lerTudo();
        
        HttpSession session = request.getSession();
        
        session.setAttribute("IndicadorExames", indicadorexames);
        
        response.sendRedirect("IndicadorExames.jsp");
    } */

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
        //processRequest(request, response);
        String op = request.getParameter("op");
        
        int codigo = Integer.parseInt(request.getParameter("codigo"));
        String dataHora = request.getParameter("data");
        String dataHoraVolta = request.getParameter("dataVolta");
        String observacao = request.getParameter("observacao");
        String cpfPaciente = request.getParameter("cpfPaciente");
        
        Medico medicoLogado = (Medico) request.getSession().getAttribute("medicoLogado");
        
        Paciente p = RepositorioPaciente.ler(cpfPaciente);
        
        Consulta c = new Consulta();
        c.setCodigo(codigo);
        c.setDataHora(dataHora);
        c.setDataHoraVolta(dataHoraVolta);
        c.setObservacao(observacao);
        c.setPaciente(p);
        c.setMedico(medicoLogado);
        
        if(op!=null && op.equals("alterar")){
            RepositorioConsultas.atualizar(c);
            request.getSession().setAttribute("msg","Consulta Atualizado com Sucesso!");
        }else{
            RepositorioConsultas.inserir(c);
            request.getSession().setAttribute("msg","Consulta Cadastrada com Sucesso!");
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
