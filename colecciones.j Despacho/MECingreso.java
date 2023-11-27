    import java.util.ArrayList;
    import java.util.List;

public class MECingreso {
    public static void main(String[] args) {
        // Crear una lista para almacenar las entradas de la tabla
        List<EntradaTabla> tabla = new ArrayList<>();

        // Agregar algunas entradas a la tabla (puedes leer estas entradas desde un archivo, base de datos, etc.)
        tabla.add(new EntradaTabla("2023-01-01", "2023-01-05", "Remito1", 1, "Estado1", 101, "Evento1",
                "Datos adicionales 1", "2023-01-03", 1001, "Tracking1", "Gestion1", "Registro1",
                "Prod001", 5, "Ciudad1", "Serie001"));

        tabla.add(new EntradaTabla("2023-02-01", "2023-02-10", "Remito2", 2, "Estado2", 102, "Evento2",
                "Datos adicionales 2", "2023-02-08", 1002, "Tracking2", "Gestion2", "Registro2",
                "Prod002", 8, "Ciudad2", "Serie002"));

        // Imprimir la tabla (o hacer lo que necesites con los datos)
        for (EntradaTabla entrada : tabla) {
            System.out.println(entrada.getFechaIngreso() + "|" + entrada.getFechaEnvio() + "|"
                    + entrada.getRemito() + "|" + entrada.getEstadoId() + "|" + entrada.getEstadoDescripcion() + "|"
                    + entrada.getEventoId() + "|" + entrada.getEventoDescripcion() + "|"
                    + entrada.getDatosAdicionales() + "|" + entrada.getFechaEvento() + "|"
                    + entrada.getOrdenVenta() + "|" + entrada.getNumeroTracking() + "|"
                    + entrada.getGestion() + "|" + entrada.getNumeroRegistro() + "|"
                    + entrada.getCodigoProducto() + "|" + entrada.getCantidadProducto() + "|"
                    + entrada.getCiudadProducto() + "|" + entrada.getNumeroSerieProducto());
        }
    }
}
    
}
