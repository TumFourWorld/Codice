package suzu.tum4world.progetto;

import java.io.Serializable;

public class QUOTES implements Serializable {

    String frase;


    public QUOTES() {}

    public String getFrase() {
        return frase;
    }

    public void setFrase(String frase) {
        this.frase = frase;
    }

}
