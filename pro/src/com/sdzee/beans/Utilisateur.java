package com.sdzee.beans;

import java.sql.Timestamp;

public class Utilisateur {

    private Long      id;
    private String    email;
    private String    motDePasse;
    private String    nom;
    private Timestamp dateInscription;

    public void setEmail( String email ) {
        this.email = email;
    }

    public String getEmail() {
        return email;
    }

    public void setMotDePasse( String motDePasse ) {
        this.motDePasse = motDePasse;
    }

    public String getMotDePasse() {
        return motDePasse;
    }

    public void setNom( String nom ) {
        this.nom = nom;
    }

    public String getNom() {
        return nom;
    }

    public Long getId() {
        return id;
    }

    public void setId( Long id ) {
        this.id = id;
    }

    public Timestamp getDateInscription() {
        return dateInscription;
    }

    public void setDateInscription( Timestamp dateinscription ) {
        this.dateInscription = dateinscription;
    }

}
