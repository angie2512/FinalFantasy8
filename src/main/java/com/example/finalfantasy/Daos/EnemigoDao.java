package com.example.finalfantasy.Daos;

import com.example.finalfantasy.Bean.Enemigos;

import java.sql.*;
import java.util.ArrayList;

public class EnemigoDao extends BaseDao{

    public ArrayList<Enemigos> listarEnemigos(){

        ArrayList<Enemigos> listaEnemigos = new ArrayList<>();
        String sql = "select * from enemigos";

        try (Connection connection = this.getConnection();
             Statement stmt = connection.createStatement();
             ResultSet rs = stmt.executeQuery(sql);) {
            int clasene;
            String nombreclase;
            while (rs.next()){
                Enemigos enemigos = new Enemigos();
                enemigos.setIdVillanos(rs.getInt("Idvillanos"));
                clasene = (rs.getInt("Clase_idClase"));
                enemigos.setNombre(rs.getString("Nombre"));
                enemigos.setAtaque(rs.getInt("Ataque"));
                enemigos.setExperiencia(rs.getInt("Experiencia"));
                enemigos.setObjeto(rs.getString("Objeto"));
                enemigos.setGenero(rs.getString("Genero"));
                try (Connection connection2 = this.getConnection();
                     Statement stmt2 = connection2.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
                     ResultSet rs1 = stmt2.executeQuery(sql);) {
                    rs1.absolute(clasene);
                    nombreclase = rs1.getString("Nombre");
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                }
                enemigos.setClase(nombreclase);
                listaEnemigos.add(enemigos);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return listaEnemigos;
    }

    public void borrar(String villanoId) {
        String sql = "DELETE FROM enemigos WHERE idVillanos = ?";

        try(Connection connection = this.getConnection();
            PreparedStatement pstmt = connection.prepareStatement(sql)){
            pstmt.setString(1,villanoId);
            pstmt.executeUpdate();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

    }

    public void anadirEnemigo(String nombre,int ataque,int experiencia, String objeto, float probabilidadObjeto, String genero,int clase_idClase) {
        String sql = "insert into enemigos (nombre, ataque, experiencia, objeto, probabilidadObjeto, genero, clase_idClase) " +
                "values (?,?,?,?,?,?,?,?)";

        try (Connection connection = this.getConnection();
             PreparedStatement pstmt = connection.prepareStatement(sql)) {
            pstmt.setString(1, nombre);
            pstmt.setInt(2, ataque);
            pstmt.setInt(3, experiencia);
            pstmt.setString(4, objeto);
            pstmt.setFloat(5, probabilidadObjeto);
            pstmt.setString(6, genero);
            pstmt.setInt(7, clase_idClase);

            pstmt.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public int obtenerIdEnemigo(String nombre){
        int idVillano=1;
        String sql="select idVillano from enemigos where Nombre = ?";
        try(Connection connection = this.getConnection();
            PreparedStatement pstmt= connection.prepareStatement(sql);){
            pstmt.setString(1,nombre);

            try(ResultSet rs= pstmt.executeQuery()){
                if(rs.next()){
                    idVillano = rs.getInt(1);
                }
            }
        }catch (SQLException e) {
            e.printStackTrace();
        }
        return idVillano;
    }
}