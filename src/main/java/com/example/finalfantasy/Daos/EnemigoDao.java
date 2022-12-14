package com.example.finalfantasy.Daos;

import com.example.finalfantasy.Bean.Enemigos;
import com.example.finalfantasy.Bean.Heroes;

import java.sql.*;
import java.util.ArrayList;
import java.util.Objects;

public class EnemigoDao extends BaseDao{
    public String obtenerClase(String id1){
        String clase = null;
        String sql1 = "select * from clase where idClase= "+id1;
        try (Connection connection = this.getConnection();
             Statement stmt = connection.createStatement();
             ResultSet rs = stmt.executeQuery(sql1);) {
            rs.next();
            clase = rs.getString("NombreClase");
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return clase;
    }

    public ArrayList<Enemigos> listarEnemigos(){

        ArrayList<Enemigos> listaEnemigos = new ArrayList<>();
        String sql = "select * from enemigos";
        String sql1 = "select * from clase";
        try (Connection connection = this.getConnection();
             Statement stmt = connection.createStatement();
             ResultSet rs = stmt.executeQuery(sql);) {
            int clasene;
            String nombreclase;
            while (rs.next()){
                Enemigos enemigos = new Enemigos();
                enemigos.setIdVillanos(rs.getInt("Idvillanos"));
                enemigos.setCase_idClase(rs.getInt("clase_idClase"));
                clasene = (rs.getInt("clase_idClase"));
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
                    nombreclase = rs1.getString("NombreClase");
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

    public String obtenerPopularObjeto() {
        String sql = "select e.Objeto,count(*) as `Cantidad` from enemigos e group by Objeto order by `Cantidad` desc ";
        try (Connection connex = this.getConnection();
             PreparedStatement pstmth = connex.prepareStatement(sql)){
            try (ResultSet rs = pstmth.executeQuery()) {
                if (rs.next()) {
                    return rs.getString(1);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }


    public String obtenerClaseComun() {
        String sql =" select e.Clase_idClase,count(*) as `Cantidad` from enemigos e group by Clase_idClase order by `Cantidad` desc";
        int idClase = 0;
        try (Connection con = this.getConnection();
             PreparedStatement pstmth = con.prepareStatement(sql)){
            try (ResultSet rs = pstmth.executeQuery()) {
                if (rs.next()) {
                    idClase = rs.getInt(1);
                        String id = String.valueOf(idClase);
                        return obtenerClase(id);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public Float enemigosSinGenero() {
        String sql = "select e.Genero,count(*) as `Cantidad` from enemigos e group by Genero order by `Cantidad` asc\n";
        int total=0;
        int sin = 0;
        float porcentaje = 0;

        try (Connection connex = this.getConnection();
             PreparedStatement pstmth = connex.prepareStatement(sql)){
            try (ResultSet rs = pstmth.executeQuery()) {
                while (rs.next()) {
                    if(Objects.equals(rs.getString("Genero"), "-")){
                        sin = rs.getInt("Cantidad");
                    }
                    total=total + rs.getInt("Cantidad");

                }
                porcentaje = (sin/total)*100;

            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return porcentaje;
    }
    public void actualizar(int idVillanos, String nombre, int ataque, int  experiencia, String objeto, float probabilidadObjeto, String genero, int claseId) {

        String sql = "UPDATE enemigos SET Nombre = ?, Ataque = ?, Experiencia = ?, Objeto = ?, ProbabilidadObjeto = ?, Genero = ?, Clase_idClase = ? WHERE idVillanos = ?";

        try (Connection connex = this.getConnection();
             PreparedStatement pstmt = connex.prepareStatement(sql)){
            System.out.println(nombre);
            pstmt.setString(1,nombre);
            pstmt.setInt(2,ataque);
            pstmt.setInt(3,experiencia);
            pstmt.setString(4,objeto);
            pstmt.setFloat(5,probabilidadObjeto);
            pstmt.setString(6, genero);
            pstmt.setInt(7,claseId);
            pstmt.setInt(8,idVillanos);
            pstmt.executeUpdate();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }








}