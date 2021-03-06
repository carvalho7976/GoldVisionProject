package br.ufc.quixada.arquitetura.gvp.util;

public enum ResponseStatus {
    SUCCESS("true"),
    FAILED("false");
    private final String status;

    private ResponseStatus(String status) {
       this.status = status;
    }

    public String getStatus() {
       return status;
    }
}