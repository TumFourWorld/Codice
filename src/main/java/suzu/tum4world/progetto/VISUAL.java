package suzu.tum4world.progetto;

import java.io.Serializable;

public class VISUAL implements Serializable {
    String pagina;

    Integer visual;

    public VISUAL() {

    }

    public String getPagina() {
        return pagina;
    }

    public void setPagina(String pagina) {
        this.pagina = pagina;
    }

    public Integer getVisual() {
        return visual;
    }

    public void setVisual(Integer visual) {
        this.visual = visual;
    }
}
