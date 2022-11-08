package com.example.finalfantasy.Daos;

import com.example.finalfantasy.Bean.Objetos;

import java.sql.*;
import java.util.ArrayList;

public class ObjetosDao extends BaseDao{
    public ArrayList<Objetos> listarObjetos() {
        ArrayList<Objetos> listaobjetos = new ArrayList<>();
        String sql = "select * from objetos";

        try (Connection conn = this.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql);){
            while (rs.next()) {
                Objetos objetos = new Objetos();
                objetos.setIdObjetos(rs.getInt("idObjetos"));
                objetos.setNombreObjeto(rs.getString("NombreObjeto"));
                objetos.setEfecto(rs.getString("Efecto"));
                objetos.setPeso(rs.getFloat("Peso"));
                objetos.setUsado(rs.getBoolean("Usado"));
                if (rs.getBoolean("Usado")){
                    objetos.setUse("Sí");
                } else if (!rs.getBoolean("Usado")) {
                    objetos.setUse("No");
                }
                listaobjetos.add(objetos);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return listaobjetos;
    }
    public int obRepetido(String nombre) {
        int repetido = 0;
        nombre = nombre.toLowerCase();
        String nombreobjeto = null;
        String sql = "SELECT * FROM objetos";
        try (Connection conn = this.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql);){
            while (rs.next()) {
                nombreobjeto=rs.getString("NombreObjeto");
                nombreobjeto = nombreobjeto.toLowerCase();
                if(nombre.equals(nombreobjeto)){
                    repetido=1;
                    break;
                }else{
                    repetido=0;
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return repetido;
    }

    public Objetos obtenerObjeto(int id) {
        Objetos ob = null;
        String sql = "SELECT * FROM objetos WHERE idObjetos = ?";
        try (Connection conn5 = this.getConnection();
             PreparedStatement pstmt5 = conn5.prepareStatement(sql)){
            pstmt5.setInt(1, id);
            try (ResultSet rs = pstmt5.executeQuery()) {
                if (rs.next()) {
                    ob = new Objetos();
                    ob.setIdObjetos(id);
                    ob.setNombreObjeto(rs.getString("NombreObjeto"));
                    ob.setPeso(rs.getFloat("Peso"));
                    ob.setEfecto(rs.getString("Efecto"));
                    ob.setUsado(rs.getBoolean("Usado"));
                    if (rs.getBoolean("Usado")){
                        ob.setUse("Sí");
                    } else if (!rs.getBoolean("Usado")) {
                        ob.setUse("No");
                    }
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return ob;
    }

    public void agregarObjeto(String nombre,String efecti, float peso, boolean usado) {

        String sql = "insert into objetos (Peso,NombreObjeto,Efecto,Usado) values (?,?,?,?)";

        try (Connection conn1 = this.getConnection();
             PreparedStatement pstmt1 = conn1.prepareStatement(sql)) {

            pstmt1.setString(2,nombre);
            pstmt1.setString(3, efecti);
            pstmt1.setFloat(1,peso);
            pstmt1.setBoolean(4,usado);
            pstmt1.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    public void editarObjetoSi(String efecto, int id) {

        String sql = "UPDATE objetos SET Efecto = ? WHERE idObjetos = ?";

        try (Connection conn1 = this.getConnection();
             PreparedStatement pstmt1 = conn1.prepareStatement(sql)) {

            pstmt1.setString(1,efecto);
            pstmt1.setInt(2, id);
            pstmt1.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    public void editarObjetoNo(String efecto, float peso, int id) {

        String sql = "UPDATE objetos SET Efecto = ?, Peso = ? WHERE idObjetos = ?";

        try (Connection conn1 = this.getConnection();
             PreparedStatement pstmt1 = conn1.prepareStatement(sql)) {

            pstmt1.setString(1,efecto);
            pstmt1.setFloat(2,peso);
            pstmt1.setInt(3, id);
            pstmt1.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    public void eliminarObjeto (int idObjeto){

        String sql = "delete from objetos where idObjetos = ?";
        String sql1 = "delete from objetos_has_heroes where Objetos_idObjetos = ?";
        try (Connection conn5 = this.getConnection();
             PreparedStatement pstmt5 = conn5.prepareStatement(sql1);) {

            pstmt5.setInt(1,idObjeto);
            pstmt5.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
        try (Connection conn6 = this.getConnection();
             PreparedStatement pstmt6 = conn6.prepareStatement(sql);) {

            pstmt6.setInt(1,idObjeto);
            pstmt6.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
