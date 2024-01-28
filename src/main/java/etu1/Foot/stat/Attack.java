package etu1.Foot.stat;


public class Attack {
    String equipeNom;
    double TirParMatch;
    double TirCadreParMatch;
    double DribbleParMatch;
    double FauteParMatch;
    double noteOffensive;

    int type;   //0: Home   1: Away     2: Overall
    public Attack() {
    }

    public Attack(String equipeNom, double tirParMatch, double tirCadreParMatch, double dribbleParMatch, double fauteParMatch, double noteOffensive, int type) {
        this.equipeNom = equipeNom;
        TirParMatch = tirParMatch;
        TirCadreParMatch = tirCadreParMatch;
        DribbleParMatch = dribbleParMatch;
        FauteParMatch = fauteParMatch;
        this.noteOffensive = noteOffensive;
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

    public double getTirParMatch() {
        return TirParMatch;
    }

    public void setTirParMatch(double tirParMatch) {
        TirParMatch = tirParMatch;
    }

    public double getTirCadreParMatch() {
        return TirCadreParMatch;
    }

    public void setTirCadreParMatch(double tirCadreParMatch) {
        TirCadreParMatch = tirCadreParMatch;
    }

    public double getDribbleParMatch() {
        return DribbleParMatch;
    }

    public void setDribbleParMatch(double dribbleParMatch) {
        DribbleParMatch = dribbleParMatch;
    }

    public double getFauteParMatch() {
        return FauteParMatch;
    }

    public void setFauteParMatch(double fauteParMatch) {
        FauteParMatch = fauteParMatch;
    }

    public double getNoteOffensive() {
        return noteOffensive;
    }

    public void setNoteOffensive(double noteOffensive) {
        this.noteOffensive = noteOffensive;
    }
}
