/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.sistemadeclinica.repositorios;

import com.mycompany.sistemadeclinica.negocio.IndicadorExame;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author jppb2
 */
public class RepositorioIndicadorExame {
    
    private static List<IndicadorExame> indicadores;
    
    static{
        indicadores = new ArrayList<>();
    }
    
    public static void inserir(IndicadorExame i){
        RepositorioIndicadorExame.indicadores.add(i);
    }
    
    public static void atualizar(IndicadorExame i){
        for(IndicadorExame iAux: indicadores){
            if(iAux.getCodigo() == i.getCodigo()){
                iAux.setIndicador(i.getIndicador());
                iAux.setDescricao(i.getDescricao());
                iAux.setMinValorReferencia(i.getMinValorReferencia());
                iAux.setMaxValorReferencia(i.getMaxValorReferencia());
                return;
            }
        }
    }
    
    public static IndicadorExame ler(int codigo){
        for(IndicadorExame iAux: indicadores){
            if(iAux.getCodigo() == codigo){
                return iAux;
            }
        }
        return null;
    }
    
    public static void deletar(int codigo){
        for(IndicadorExame iAux: indicadores){
            if(iAux.getCodigo() == codigo){
                indicadores.remove(iAux);
                return;
            }
        }
    }
    
    public static List<IndicadorExame> lerTudo(){
        return indicadores;
    }
    
}
