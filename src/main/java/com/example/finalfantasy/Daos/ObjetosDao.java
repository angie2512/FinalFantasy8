package com.example.finalfantasy.Daos;

import com.example.finalfantasy.Bean.Objetos;

import java.sql.*;
import java.util.ArrayList;

public class ObjetosDao extends BaseDao{
    public ArrayList<Objetos> listarObjetos() {
        ArrayList<Objetos> lista = new ArrayList<>();
        String sql = "select * from objetos";

        try (Connection conn = this.getConnection();
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery(sql);){
            while (rs.next()) {
                Objetos objetos = new Objetos();
                objetos.setIdObjetos(rs.getInt(1));
                objetos.setNombreObjeto(rs.getString(3));
                objetos.setEfecto(rs.getString(4));
                objetos.setPeso(rs.getFloat(2));
                objetos.setUsado(rs.getBoolean(5));
                lista.add(objetos);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return lista;
    }
}
