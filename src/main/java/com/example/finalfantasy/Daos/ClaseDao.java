package com.example.finalfantasy.Daos;

import com.example.finalfantasy.Bean.Clase;
import com.example.finalfantasy.Bean.ElementoClase;

import java.sql.*;
import java.util.ArrayList;

public class ClaseDao  extends  BaseDao{
    public void actualizar(String elemento, float daño, String clase) {

        String sql = "UPDATE clase_has_elementos SET daño = ? WHERE Clase_idClase = ? and Elementos_idElementos = ?";

        try (Connection conne8 = this.getConnection();
             PreparedStatement pstm8 = conne8.prepareStatement(sql)) {
            pstm8.setFloat(1, daño);
            pstm8.setString(2, clase);
            pstm8.setString(3, elemento);
            pstm8.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
    public ArrayList<ElementoClase> listarfort(String id){
        ArrayList<ElementoClase> listafort = new ArrayList<>();
        String sql = "select * from  clase_has_elementos where Clase_idClase ="+id;
        String sql1 = "select * from clase";
        String sql2 = "select * from elementos";
        float damage = 0;

        try (Connection conn1 = this.getConnection();
             Statement stmt1 = conn1.createStatement();
             ResultSet rs = stmt1.executeQuery(sql);){
            while (rs.next()) {
                ElementoClase ele = new ElementoClase();
                ele.setIdClase(rs.getInt("Clase_idClase"));
                ele.setIdelemento(rs.getInt("Elementos_idElementos"));
                ele.setDaño(rs.getFloat("daño"));
                try (Connection connection2 = this.getConnection();
                     Statement stmt2 = connection2.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
                     ResultSet rs1 = stmt2.executeQuery(sql1);) {
                    rs1.absolute(rs.getInt("Clase_idClase"));
                    ele.setNombreClase(rs1.getString("NombreClase"));
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                }
                try (Connection connection3 = this.getConnection();
                     Statement stmt3 = connection3.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
                     ResultSet rs2 = stmt3.executeQuery(sql2);) {
                    rs2.absolute(rs.getInt("Elementos_idElementos"));
                    ele.setElemento(rs2.getString("NombreElemento"));
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                }
                ele.setDaño(rs.getFloat("daño"));
                damage = rs.getFloat("daño");
                if (damage>1){
                    ele.setFort("Debilidad");
                } else if (damage<0) {
                    ele.setFort("Fortaleza");
                }else {
                    ele.setFort("-");
                }
                listafort.add(ele);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return listafort;
    }

    public ArrayList<Clase> listarClases(){
        ArrayList<Clase> listaclase = new ArrayList<>();
        String sql = "select * from  clase";

        try (Connection conn = this.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql);){
            while (rs.next()) {
                Clase clase = new Clase();
                clase.setIdClase(rs.getInt("idClase"));
                clase.setNombreClase(rs.getString("nombreClase"));

                listaclase.add(clase);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return listaclase;
    }
}
