/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.sistemadeclinica.repositorios;

import com.mycompany.sistemadeclinica.negocio.Medicamento;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author jppb2
 */
public class RepositorioMedicamento {
    
    private static List<Medicamento> medicamentos;
    
    static{
        medicamentos = new ArrayList<>();
    }
    
    public static void inserir(Medicamento m){
        RepositorioMedicamento.medicamentos.add(m);
    }
    
    public static void atualizar(Medicamento m){
        for(Medicamento mAux: medicamentos){
            if(mAux.getCodigo() == m.getCodigo()){
                mAux.setNome(m.getNome());
                mAux.setDescricao(m.getDescricao());
                mAux.setDosagem(m.getDosagem());
                mAux.setTipoDosagem(m.getTipoDosagem());
                mAux.setObservacao(m.getObservacao());
                return;
            }
        }
    }
    
    public static Medicamento ler(int codigo){
        for(Medicamento mAux: medicamentos){
            if(mAux.getCodigo() == codigo){
                return mAux;
            }
        }
        return null;
    }
    
    public static void deletar(int codigo){
        for(Medicamento mAux: medicamentos){
            if(mAux.getCodigo() == codigo){
                medicamentos.remove(mAux);
                return;
            }
        }
    }
    
    public static List<Medicamento> lerTudo(){
        return medicamentos;
    }
    
}
