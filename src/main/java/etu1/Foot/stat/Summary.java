package etu1.Foot.stat;

import jakarta.persistence.Entity;

public class Summary {
    String equipeNom;
    int but;
    double tirParMatch;
    int cartonJaune;
    int cartonRouge;
    double possession;
    double passeReussie;
    double duelsAeriensRemportes;
    double noteSummary;

    int type;   //0: Home   1: Away     2: Overall

    public Summary() {
    }

    public Summary(String equipeNom, int but, double tirParMatch, int cartonJaune, int cartonRouge, double possession, double passeReussie, double duelsAeriensRemportes, double noteSummary, int type) {
        this.equipeNom = equipeNom;
        this.but = but;
        this.tirParMatch = tirParMatch;
        this.cartonJaune = cartonJaune;
        this.cartonRouge = cartonRouge;
        this.possession = possession;
        this.passeReussie = passeReussie;
        this.duelsAeriensRemportes = duelsAeriensRemportes;
        this.noteSummary = noteSummary;
        this.type = type;
    }

    public String getEquipeNom() {
        return equipeNom;
    }

    public void setEquipeNom(String equipeNom) {
        this.equipeNom = equipeNom;
    }

    public int getBut() {
        return but;
    }

    public int getType() {
        return type;
    }

    public void setBut(int but) {
        this.but = but;
    }

    public void setType(int type) {
        this.type = type;
    }

    public double getTirParMatch() {
        return tirParMatch;
    }

    public void setTirParMatch(double tirParMatch) {
        this.tirParMatch = tirParMatch;
    }

    public int getCartonJaune() {
        return cartonJaune;
    }

    public void setCartonJaune(int cartonJaune) {
        this.cartonJaune = cartonJaune;
    }

    public int getCartonRouge() {
        return cartonRouge;
    }

    public void setCartonRouge(int cartonRouge) {
        this.cartonRouge = cartonRouge;
    }

    public double getPossession() {
        return possession;
    }

    public void setPossession(double possession) {
        this.possession = possession;
    }

    public double getPasseReussie() {
        return passeReussie;
    }

    public void setPasseReussie(double passeReussie) {
        this.passeReussie = passeReussie;
    }

    public double getDuelsAeriensRemportes() {
        return duelsAeriensRemportes;
    }

    public void setDuelsAeriensRemportes(double duelsAeriensRemportes) {
        this.duelsAeriensRemportes = duelsAeriensRemportes;
    }

    public double getNoteSummary() {
        return noteSummary;
    }

    public void setNoteSummary(double noteSummary) {
        this.noteSummary = noteSummary;
    }
}
