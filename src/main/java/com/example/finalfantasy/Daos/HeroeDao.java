package com.example.finalfantasy.Daos;

import com.example.finalfantasy.Bean.Heroes;
import java.sql.*;
import java.util.ArrayList;


public class HeroeDao extends BaseDao{
    public ArrayList<Heroes> listarHeroes() {
        ArrayList<Heroes> listaHeroes = new ArrayList<>();
        String sql = "select * from heroes";

        try (Connection connection = this.getConnection();
             Statement stmt = connection.createStatement();
             ResultSet rs = stmt.executeQuery(sql);) {
            float exp = 0;
            int level;
            while (rs.next()) {
                Heroes heroes = new Heroes();
                heroes.setIdHeroes(rs.getInt("idHeroes"));
                heroes.setNombre(rs.getString("Nombre"));
                heroes.setEdad(rs.getInt("Edad"));
                heroes.setGenero(rs.getString("Genero"));
                heroes.setAtaque(rs.getInt("Ataque"));
                heroes.setClase(rs.getString("Clase"));
                Heroes pareja = new Heroes();
                heroes.setPareja(pareja);
                pareja.setIdHeroes(rs.getInt("idPareja"));
                pareja.setNombre(mostrarNombreHeroe(pareja.getIdHeroes()));
                heroes.setExperienciaInicial(rs.getFloat("ExperienciaInicial"));
                level = rs.getInt("Nivel");
                if (0<level && level<=15){
                    exp = (level*level*level)*(24+(level+1)/3)/50;
                } else if (16<=level && level<=35) {
                    exp = (level*level*level)*(14+(level))/50;
                } else if (36<=level && level<=100) {
                    exp = (level*level*level)*(32+(level)/2)/50;
                }
                heroes.setNivel(level);
                listaHeroes.add(heroes);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return listaHeroes;
    }

    public String mostrarNombreHeroe(int idHeroe){
        try(Connection conn = this.getConnection();
        Statement stmt = conn.createStatement();
        ResultSet rs = stmt.executeQuery("select nombre from heroes where idHeroes="+idHeroe); ){
            if(rs.next()){
                return rs.getString(1);
            }
        }catch (SQLException e){
            e.printStackTrace();
        }
        return null;
    }

    public ArrayList<Heroes> buscarPorNombre(String nombre){

        String sql = "select * from heroes where Nombre like ?";
        ArrayList<Heroes> listaFiltrada = new ArrayList<>();
        float exp = 0;
        int level;
        try(Connection conn = this.getConnection();
            PreparedStatement pstmt = conn.prepareStatement(sql);){
            pstmt.setString(1,"%"+nombre+"%");
            try(ResultSet rs = pstmt.executeQuery();){
            while(rs.next()){
                Heroes heroes = new Heroes();
                heroes.setIdHeroes(rs.getInt("idHeroes"));
                heroes.setNombre(rs.getString("Nombre"));
                heroes.setEdad(rs.getInt("Edad"));
                heroes.setGenero(rs.getString("Genero"));
                heroes.setAtaque(rs.getInt("Ataque"));
                heroes.setClase(rs.getString("Clase"));
                Heroes pareja = new Heroes();
                heroes.setPareja(pareja);
                pareja.setIdHeroes(rs.getInt("idPareja"));
                pareja.setNombre(mostrarNombreHeroe(pareja.getIdHeroes()));
                heroes.setExperienciaInicial(rs.getFloat("ExperienciaInicial"));
                level = rs.getInt("Nivel");
                if (0<level && level<=15){
                    exp = (level*level*level)*(24+(level+1)/3)/50;
                } else if (16<=level && level<=35) {
                    exp = (level*level*level)*(14+(level))/50;
                } else if (36<=level && level<=100) {
                    exp = (level*level*level)*(32+(level)/2)/50;
                }
                heroes.setNivel(level);
                listaFiltrada.add(heroes);
            }}
        }catch (SQLException e){
            e.printStackTrace();
        }
        return listaFiltrada;
    }


    public void añadirHeroes(String nombreh,int edadh,String generoh, int nivelh, int ataqueh,String claseh,int parejah) throws SQLException {
        String sql = "insert into heroes (Edad,Nombre,Genero,Nivel,Ataque,Clase,idPareja,ExperienciaInicial) values (?,?,?,?,?,?,?,?)";
        float exp = 0;

        try (Connection conn = this.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql);) {
            pstmt.setInt(1,edadh);
            pstmt.setString(2,nombreh);
            pstmt.setString(3,generoh);
            pstmt.setInt(4,nivelh);
            pstmt.setInt(5,ataqueh);
            pstmt.setString(6,claseh);
            pstmt.setInt(7,parejah);
            if (0<nivelh && nivelh<=15){
                exp = (nivelh*nivelh*nivelh)*(24+(nivelh+1)/3)/50;
            } else if (16<=nivelh && nivelh<=35) {
                exp = (nivelh*nivelh*nivelh)*(14+(nivelh))/50;
            } else if (36<=nivelh && nivelh<=100) {
                exp = (nivelh*nivelh*nivelh)*(32+(nivelh)/2)/50;
            }
            pstmt.setFloat(8,exp);
            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}