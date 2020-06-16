// VARIABLE PARA MANEJAR LOS GRAFICOS
PGraphics pg;

// VARIABLE PARA LAS IMAGENES
PImage imagen_original;
PImage imagen_convertir_escala_grises;



// --- CONFIGURACION DE LAS VARIABLES INICIALES ---
// NOMBRE DEL ARCHIVO DE LA IMAGEN
String nombre_imagen = "imagen_prueba_01.jpg";
// TAMANO DE LA IMAGEN
int tamano_horizontal = 300;
int tamano_vertical = 300;
//ESPACIADO DEL DEL BORDE DE LA VENTANA CON RESPECTO A LA IMAGEN
int espacio_borde = 10;
// ---   --- 

void setup() {
    // TAMA#O DEL CANVAS
    size(630, 350);

    // CONFIGURACION DE LA VARIABLE (pg)
    pg = createGraphics(630, 350);

    // CARGAMOS LA IMAGEN ORIGINAL
    imagen_original = loadImage(nombre_imagen);

    // CARGAMOS UNA COPIA DE LA IMAGEN ORIGINAL
    imagen_convertir_escala_grises = loadImage(nombre_imagen);
}

void draw() {
    pintar_imagen_original();
    convertir_escala_grises(imagen_convertir_escala_grises);
}

void pintar_imagen_original(){
    pg.beginDraw();
    pg.image(imagen_original, 0, 0);
    pg.endDraw();
    image(pg, espacio_borde, espacio_borde);
}

void convertir_escala_grises(PImage imagen_modificar){
    pg.beginDraw();
    // SE CARGAN LOS PIXELES DE LA IMAGEN ORIGINAL EN UN ARREGLO DE TAMA#O (ANCHO x ALTO) DE LA IMAGEN
    imagen_original.loadPixels();

    for (int y = 0; y < imagen_original.height; y++) {
        for (int x = 0; x < imagen_original.width; x++) {
            // SE CONVIERTE LA POSICION DEL PIXEL A MODIFICAR EN POSICION UN ARREGLO
            int posicion_arreglo = x + (y * imagen_original.width);
            float color_gris = 0;
            color_gris = ((0.21) * red(imagen_original.pixels[posicion_arreglo])) + ((0.72) * green(imagen_original.pixels[posicion_arreglo])) + ((0.07) * blue(imagen_original.pixels[posicion_arreglo]));
            // SE ALMACENA EL COLOR GRIS RESULTANTE DEL METODO DE CONVERSION
            // EN LA POSICION DEL ARREGLO DE LA IMAGEN A MODIFICAR
            imagen_modificar.pixels[posicion_arreglo] = color(color_gris, color_gris, color_gris);
        }
    }
    imagen_modificar.updatePixels();
    pg.image(imagen_modificar, 0, 0);
    pg.endDraw();
    image(pg, (tamano_horizontal + (espacio_borde*2)), espacio_borde);
}