package com.mycompany.sistemadeclinica.repositorios;

import com.mycompany.sistemadeclinica.negocio.Medico;
import java.util.ArrayList;
import java.util.List;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

/**
 *
 * @author jppb2
 */
public class RepositorioMedico {
    
     private static List<Medico> medicos;
    
    static{
        medicos = new ArrayList<>();
    }
    
    public static void inserir(Medico m){
        RepositorioMedico.medicos.add(m);
    }
    
    public static void atualizar(Medico m){
        for(Medico mAux: medicos){
            if(mAux.getCrm() == null ? m.getCrm() == null : mAux.getCrm().equals(m.getCrm())){
                mAux.setContato(m.getContato());
                mAux.setEspecialidade(m.getEspecialidade());
                mAux.setNome(m.getNome());
                return;
            }
        }
    }
    
    public static Medico ler(String crm){
        for(Medico mAux: medicos){
            if(mAux.getCrm() == null ? crm == null : mAux.getCrm().equals(crm)){
                return mAux;
            }
        }
        return null;
    }
    
    public static void deletar(String crm){
        for(Medico mAux: medicos){
            if(mAux.getCrm() == null ? crm == null : mAux.getCrm().equals(crm)){
                medicos.remove(mAux);
                return;
            }
        }
    }
    
    public static List<Medico> lerTudo(){
        return medicos;
    }
    
    public static Medico login(String crm, String senha){
        for(Medico m: medicos){
            if(m.getCrm().equals(crm) && m.getSenha().equals(senha)){
                return m;
            }
        }
        return null;
    }
    
    public static void alterarSenha(String crm, String senha){
        
        for(Medico mAux: medicos){
            if(mAux.getCrm() == null ? crm == null : mAux.getCrm().equals(crm)){
                mAux.setSenha(senha);
                return;
            }
        }
        
    }
    
}
