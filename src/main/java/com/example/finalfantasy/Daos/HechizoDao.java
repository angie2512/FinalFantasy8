package com.example.finalfantasy.Daos;

import com.example.finalfantasy.Bean.Hechizos;

import java.sql.*;
import java.util.ArrayList;

public class HechizoDao extends  BaseDao{
    public ArrayList<Hechizos> listarHechizos() throws SQLException{

        ArrayList<Hechizos> listaHechizos = new ArrayList<>();
        String sql = "select * from hechizos";
        String sql1 = "select * from elementos";

        try (Connection connection = this.getConnection();
             Statement stmt = connection.createStatement();
             ResultSet rs = stmt.executeQuery(sql);) {
            int ele;
            while (rs.next()) {
                Hechizos hechizos = new Hechizos();
                hechizos.setIdHechizos(rs.getInt("idHechizos"));
                hechizos.setNombreHechizo(rs.getString("NombreHechizos"));
                hechizos.setPotencia(rs.getInt("Potencia"));
                hechizos.setPrecision(rs.getInt("Precision"));
                hechizos.setNivelAprendizaje(rs.getInt("NivelAprendizaje"));
                hechizos.setBase(rs.getInt("idHechizoBase"));
                String nombreelemento;
                hechizos.setNelemento(rs.getInt("Elementos_idElementos"));
                ele = rs.getInt("Elementos_idElementos");
                try (Connection connection1 = this.getConnection();
                     Statement stmt1 = connection1.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
                     ResultSet rs1 = stmt1.executeQuery(sql1);) {
                    rs1.absolute(ele);
                    nombreelemento = rs1.getString("NombreElemento");
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                }
                hechizos.setElemento(nombreelemento);
                listaHechizos.add(hechizos);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return listaHechizos;
    }

    public void agregarHechizo(String nombre,int potencia, int accurate, int learn, int base,int elemento) {

        String sql = "insert into hechizos (NombreHechizo,Potencia,Precision,NivelAprendizaje,idHechizoBase,Elementos_idElementos)";

        try (Connection conn1 = this.getConnection();
             PreparedStatement pstmt1 = conn1.prepareStatement(sql);) {

            pstmt1.setString(1,nombre);
            pstmt1.setInt(2, potencia);
            pstmt1.setInt(3,accurate);
            pstmt1.setInt(4,learn);
            pstmt1.setInt(5,base);
            pstmt1.setInt(6,elemento);
            pstmt1.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    public void eliminarHechizo (int idHechizo){

        String sql = "delete from hechizos where idHechizos = ?";
        String sql1 = "delete from hechizos where idHechizoBase = ?";
        try (Connection conn3 = this.getConnection();
             PreparedStatement pstmt4 = conn3.prepareStatement(sql1);) {

            pstmt4.setInt(1,idHechizo);
            pstmt4.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
        try (Connection conn2 = this.getConnection();
             PreparedStatement pstmt3 = conn2.prepareStatement(sql);) {

            pstmt3.setInt(1,idHechizo);
            pstmt3.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
