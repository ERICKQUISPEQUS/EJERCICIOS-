# Cargar librerías necesarias
library(ggplot2)

# Definir los datos
X <- c(30, 35, 40, 45, 50, 55, 60, 65, 70, 75)  # Longitud del animal (cm)
Y <- c(2, 2.5, 3.2, 3.8, 4.5, 5.2, 6, 6.8, 7.5, 8.3)  # Peso del animal (kg)

# Ajustar el modelo de regresión lineal
modelo <- lm(Y ~ X)

# Obtener las predicciones del modelo
Y_pred <- predict(modelo)

# Calcular el coeficiente de determinación R^2
r2 <- summary(modelo)$r.squared
cat(sprintf("Coeficiente de correlación (R^2): %.2f\n", r2))

# Crear un data.frame para facilitar el gráfico
data <- data.frame(X, Y, Y_pred)

# Crear el gráfico de dispersión con la línea de regresión
ggplot(data, aes(x = X, y = Y)) +
  geom_point(color = "blue", size = 3) +  # Puntos de datos reales
  geom_line(aes(x = X, y = Y_pred), color = "red", size = 1.5, linetype = "solid") +  # Línea de regresión
  labs(
    title = "Regresión lineal: Peso vs Longitud del animal",
    x = "Longitud del animal (cm)",
    y = "Peso (kg)"
  ) +
  theme_minimal() +
  theme(legend.position = "none")  # Eliminar leyenda, ya que no es necesaria
