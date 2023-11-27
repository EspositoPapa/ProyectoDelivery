iimport javax.swing.JOptionPane;

public class HolaMundo {
    public static void main(String[] args) {
        // Mostrar un cuadro de diálogo con un mensaje
        JOptionPane.showMessageDialog(null, "Hola, esto es un mensaje de ejemplo.");

        // Solicitar un número decimal al usuario mediante un cuadro de diálogo
        String numeroDecimalString = JOptionPane.showInputDialog(null, "Ingrese un número decimal:");
        
        // Convertir la cadena ingresada a un número decimal (double)
        double numeroDecimal = Double.parseDouble(numeroDecimalString);

        // Imprimir el número decimal en la consola
        System.out.println("El número decimal ingresado es: " + numeroDecimal);
    }
}