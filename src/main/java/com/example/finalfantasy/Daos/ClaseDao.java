package com.example.finalfantasy.Daos;

import com.example.finalfantasy.Bean.Clase;

import java.sql.*;
import java.util.ArrayList;

public class ClaseDao  extends  BaseDao{

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
