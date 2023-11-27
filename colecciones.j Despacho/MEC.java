public class EntradaTabla {
    private String fechaIngreso;
    private String fechaEnvio;
    private String remito;
    private int estadoId;
    private String estadoDescripcion;
    private int eventoId;
    private String eventoDescripcion;
    private String datosAdicionales;
    private String fechaEvento;
    private int ordenVenta;
    private String numeroTracking;
    private String gestion;
    private String numeroRegistro;
    private String codigoProducto;
    private int cantidadProducto;
    private String ciudadProducto;
    private String numeroSerieProducto;

    // Constructor
    public EntradaTabla(String fechaIngreso, String fechaEnvio, String remito, int estadoId, String estadoDescripcion,
                        int eventoId, String eventoDescripcion, String datosAdicionales, String fechaEvento,
                        int ordenVenta, String numeroTracking, String gestion, String numeroRegistro,
                        String codigoProducto, int cantidadProducto, String ciudadProducto, String numeroSerieProducto) {
        this.fechaIngreso = fechaIngreso;
        this.fechaEnvio = fechaEnvio;
        this.remito = remito;
        this.estadoId = estadoId;
        this.estadoDescripcion = estadoDescripcion;
        this.eventoId = eventoId;
        this.eventoDescripcion = eventoDescripcion;
        this.datosAdicionales = datosAdicionales;
        this.fechaEvento = fechaEvento;
        this.ordenVenta = ordenVenta;
        this.numeroTracking = numeroTracking;
        this.gestion = gestion;
        this.numeroRegistro = numeroRegistro;
        this.codigoProducto = codigoProducto;
        this.cantidadProducto = cantidadProducto;
        this.ciudadProducto = ciudadProducto;
        this.numeroSerieProducto = numeroSerieProducto;
    }

    // Puedes agregar getters y setters según sea necesario
}
