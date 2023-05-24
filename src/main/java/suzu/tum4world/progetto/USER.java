package suzu.tum4world.progetto;

import java.io.Serializable;

public class USER implements Serializable {
    String nome;
    String cognome;
    String data_nascita;
    String email;
    String num_tel;
    Boolean simp;
    String username;
    String password;
    Boolean admin;
    Boolean att1;
    Boolean att2;
    Boolean att3;

    public USER() {
    }

    public String getNome() {
        return nome;
    }

    public String getCognome() {
        return cognome;
    }

    public String getData_nascita() {
        return data_nascita;
    }

    public String getEmail() {
        return email;
    }

    public String getNum_tel() {
        return num_tel;
    }

    public Boolean getSimp() {
        return simp;
    }

    public String getUsername() {
        return username;
    }

    public String getPassword() {
        return password;
    }

    public Boolean getAdmin() {
        return admin;
    }

    public Boolean getAtt1() {
        return att1;
    }

    public Boolean getAtt2() {
        return att2;
    }

    public Boolean getAtt3() {
        return att3;
    }


    public void setNome(String nome) {
        this.nome = nome;
    }

    public void setCognome(String cognome) {
        this.cognome=cognome;
    }

    public void setData_nascita(String data_nascita) {
        this.data_nascita=data_nascita;
    }

    public void setEmail(String email) {
        this.email=email;
    }

    public void setNum_tel(String num_tel) {
        this.num_tel=num_tel;
    }

    public void setSimp(Boolean simp) {
        this.simp=simp;
    }

    public void setUsername(String username) {
        this.username=username;
    }

    public void setPassword(String password) {
        this.password=password;
    }

    public void setAdmin(Boolean admin) {
        this.admin=admin;
    }

    public void setAtt1(Boolean att1) {
        this.att1=att1;
    }

    public void setAtt2(Boolean att2) {
        this.att2=att2;
    }

    public void setAtt3(Boolean att3) {
        this.att3=att3;
    }


    }
