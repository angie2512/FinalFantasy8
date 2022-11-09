package com.example.finalfantasy.Daos;

import com.example.finalfantasy.Bean.Enemigos;
import com.example.finalfantasy.Bean.Heroes;

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
                enemigos.setProbabilidadObjeto(rs.getFloat("ProbabilidadObjeto"));
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

    public void borrar(int villanoId) {

        String sql = "delete from enemigos where idVillanos = ?";
        try (Connection conn6 = this.getConnection();
             PreparedStatement pstmt6 = conn6.prepareStatement(sql);) {

            pstmt6.setInt(1,villanoId);
            pstmt6.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void anadirEnemigo(Enemigos enemigos) throws SQLException{
        String sql = "insert into enemigos (nombre, ataque, experiencia, objeto, probabilidadObjeto, genero, clase_idClase) " + "values (?,?,?,?,?,?,?)";

        try (Connection connection = this.getConnection();
             PreparedStatement pstmt = connection.prepareStatement(sql)) {
            pstmt.setString(1, enemigos.getNombre());
            pstmt.setInt(2, enemigos.getAtaque());
            pstmt.setInt(3, enemigos.getExperiencia());
            pstmt.setString(4, enemigos.getObjeto());
            pstmt.setFloat(5, enemigos.getProbabilidadObjeto());
            pstmt.setString(6, enemigos.getGenero());
            pstmt.setInt(7, enemigos.getCase_idClase());

            pstmt.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
    public ArrayList<Enemigos> buscarPorNombre(String nombre){

        String sql = "select * from enemigos where Nombre like ?";
        String sql1 = "select * from enemigos";
        ArrayList<Enemigos> listaFiltrada1 = new ArrayList<>();
        int clasene;
        String nombreclase;
        try(Connection conn = this.getConnection();
            PreparedStatement pstmt = conn.prepareStatement(sql);){
            pstmt.setString(1,"%"+nombre+"%");
            try(ResultSet rs = pstmt.executeQuery();){
                while(rs.next()){
                    Enemigos enemigos = new Enemigos();
                    enemigos.setIdVillanos(rs.getInt("Idvillanos"));
                    clasene = (rs.getInt("Clase_idClase"));
                    enemigos.setNombre(rs.getString("Nombre"));
                    enemigos.setAtaque(rs.getInt("Ataque"));
                    enemigos.setExperiencia(rs.getInt("Experiencia"));
                    enemigos.setObjeto(rs.getString("Objeto"));
                    enemigos.setGenero(rs.getString("Genero"));
                    enemigos.setProbabilidadObjeto(rs.getFloat("ProbabilidadObjeto"));
                    try (Connection connection2 = this.getConnection();
                         Statement stmt2 = connection2.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
                         ResultSet rs1 = stmt2.executeQuery(sql1);) {
                        rs1.absolute(clasene);
                        nombreclase = rs1.getString("Nombre");
                    } catch (SQLException e) {
                        throw new RuntimeException(e);
                    }
                    enemigos.setClase(nombreclase);
                    listaFiltrada1.add(enemigos);
                }
            }
        }catch (SQLException e){
            e.printStackTrace();
        }
        return listaFiltrada1;
    }

    public Enemigos obtenerEnemigo(int id) {
        Enemigos en = null;
        String sql = "SELECT * FROM enemigos WHERE idVillanos = ?";
        try (Connection connex = this.getConnection();
             PreparedStatement pstmth = connex.prepareStatement(sql)){
            pstmth.setInt(1, id);
            try (ResultSet rs = pstmth.executeQuery()) {
                if (rs.next()) {
                    en = new Enemigos();
                    en.setIdVillanos(id);
                    en.setNombre(rs.getString("Nombre"));
                    en.setAtaque(rs.getInt("Ataque"));
                    en.setExperiencia(rs.getInt("Experiencia"));
                    en.setObjeto(rs.getString("Objeto"));
                    en.setProbabilidadObjeto(rs.getFloat("ProbabilidadObjeto"));
                    en.setCase_idClase(rs.getInt("ClaseId"));

                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return en;
    }
    
    public void actualizar(int idVillanos, String nombre, int ataque, int  experiencia, String objeto, float probabilidadObjeto, String genero, int claseId) {

        String sql = "UPDATE enemigos SET Nombre = ?, Ataque = ?, Experiencia = ?, Objeto = ?, ProbabilidadObjeto = ?, Genero = ?, Clase_idClase = ? WHERE idVillanos = ?";

        try (Connection connex = this.getConnection();
             PreparedStatement pstmt = connex.prepareStatement(sql)){
            System.out.println(nombre);
            pstmt.setInt(1,idVillanos);
            pstmt.setString(2,nombre);
            pstmt.setInt(3,ataque);
            pstmt.setInt(4,experiencia);
            pstmt.setString(5,objeto);
            pstmt.setFloat(6,probabilidadObjeto);
            pstmt.setString(7, genero);
            pstmt.setInt(8,claseId);

            pstmt.executeUpdate();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }








}