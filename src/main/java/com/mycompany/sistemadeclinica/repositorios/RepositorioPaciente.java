/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.sistemadeclinica.repositorios;

import com.mycompany.sistemadeclinica.negocio.Paciente;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author jppb2
 */
public class RepositorioPaciente {
    
    private static List<Paciente> pacientes;
    
    static{
        pacientes = new ArrayList<>();
    }
    
    public static void inserir(Paciente p){
        RepositorioPaciente.pacientes.add(p);
    }
    
    public static void atualizar(Paciente p){
        for(Paciente pAux: pacientes){
            if(pAux.getCpf() == null ? p.getCpf() == null : pAux.getCpf().equals(p.getCpf())){
                pAux.setContato(p.getContato());
                pAux.setEndereco(p.getEndereco());
                pAux.setNome(p.getNome());
                pAux.setPlanoSaude(p.getPlanoSaude());
                return;
            }
        }
    }
    
    public static Paciente ler(String cpf){
        for(Paciente pAux: pacientes){
            if(pAux.getCpf() == null ? cpf == null : pAux.getCpf().equals(cpf)){
                return pAux;
            }
        }
        return null;
    }
    
    public static void deletar(String cpf){
        for(Paciente pAux: pacientes){
            if(pAux.getCpf() == null ? cpf == null : pAux.getCpf().equals(cpf)){
                pacientes.remove(pAux);
                return;
            }
        }
    }
    
    public static List<Paciente> lerTudo(){
        return pacientes;
    }
}
