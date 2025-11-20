/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.sistemadeclinica.repositorios;

import com.mycompany.sistemadeclinica.negocio.Consulta;
import com.mycompany.sistemadeclinica.negocio.Medico;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author jppb2
 */
public class RepositorioConsultas {
    
    private static List<Consulta> consultas;
    
    static{
        consultas =  new ArrayList<>();
    }
    
    public static void inserir(Consulta c){
        RepositorioConsultas.consultas.add(c);
    }
    
    public static void atualizar(Consulta c){
        for(Consulta cAux: consultas){
            if(cAux.getCodigo() == c.getCodigo()){
                cAux.setDataHora(c.getDataHora());
                cAux.setDataHoraVolta(c.getDataHoraVolta());
                cAux.setObservacao(c.getObservacao());
                return;
            }
        }
    }
    
    public static Consulta ler(int codigo){
        for(Consulta cAux: consultas){
            if(cAux.getCodigo() == codigo){
                return cAux;
            }
        }
        return null;
    }
    
    public static void deletar(int codigo){
        for(Consulta cAux: consultas){
            if(cAux.getCodigo() == codigo){
                consultas.remove(cAux);
                return;
            }
        }
    }
    
    public static List<Consulta> lerTudo(){
        return consultas;
    }
    
    public static List<Consulta> lerPorMedico(Medico m) {
        
        String crmMedico = m.getCrm();
        
        List<Consulta> consultasDoMedico = new ArrayList<>();
        
        for (Consulta c : consultas) {
            if (c.getMedico() != null && c.getMedico().getCrm().equals(crmMedico)) {
                consultasDoMedico.add(c);
            }
        }
        return consultasDoMedico;
    
    
    }
}

    

