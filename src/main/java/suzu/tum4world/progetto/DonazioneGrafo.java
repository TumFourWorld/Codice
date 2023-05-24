package suzu.tum4world.progetto;

import java.io.Serializable;

public class DonazioneGrafo implements Serializable {

    String mese;
    Double importo;

    public DonazioneGrafo() {
    }

    public String getMese() {
        return mese;
    }

    public Double getImporto() {
        return importo;
    }

    public void setMese(String mese) {
        this.mese = mese;
    }

    public void setImporto(Double importo) {
        this.importo = importo;
    }
}
