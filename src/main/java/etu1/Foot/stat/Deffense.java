package etu1.Foot.stat;


public class Deffense {
    String equipeNom;
    double TirConcedeParMatch;
    double TacleParMatch;
    double InterceptionParMatch;
    double FauteParMatch;
    double HorsJeuParMatch;
    double noteDefensive;

    int type;   //0: Home   1: Away     2: Overall

    public Deffense() {
    }

    public Deffense(String equipeNom, double tirConcedeParMatch, double tacleParMatch, double interceptionParMatch, double fauteParMatch, double horsJeuParMatch, double noteDefensive, int type) {
        this.equipeNom = equipeNom;
        TirConcedeParMatch = tirConcedeParMatch;
        TacleParMatch = tacleParMatch;
        InterceptionParMatch = interceptionParMatch;
        FauteParMatch = fauteParMatch;
        HorsJeuParMatch = horsJeuParMatch;
        this.noteDefensive = noteDefensive;
        this.type = type;
    }

    public int getType() {
        return type;
    }

    public void setType(int type) {
        this.type = type;
    }

    public String getEquipeNom() {
        return equipeNom;
    }

    public void setEquipeNom(String equipeNom) {
        this.equipeNom = equipeNom;
    }

    public double getTirConcedeParMatch() {
        return TirConcedeParMatch;
    }

    public void setTirConcedeParMatch(double tirConcedeParMatch) {
        TirConcedeParMatch = tirConcedeParMatch;
    }

    public double getTacleParMatch() {
        return TacleParMatch;
    }

    public void setTacleParMatch(double tacleParMatch) {
        TacleParMatch = tacleParMatch;
    }

    public double getInterceptionParMatch() {
        return InterceptionParMatch;
    }

    public void setInterceptionParMatch(double interceptionParMatch) {
        InterceptionParMatch = interceptionParMatch;
    }

    public double getFauteParMatch() {
        return FauteParMatch;
    }

    public void setFauteParMatch(double fauteParMatch) {
        FauteParMatch = fauteParMatch;
    }

    public double getHorsJeuParMatch() {
        return HorsJeuParMatch;
    }

    public void setHorsJeuParMatch(double horsJeuParMatch) {
        HorsJeuParMatch = horsJeuParMatch;
    }

    public double getNoteDefensive() {
        return noteDefensive;
    }

    public void setNoteDefensive(double noteDefensive) {
        this.noteDefensive = noteDefensive;
    }
}
