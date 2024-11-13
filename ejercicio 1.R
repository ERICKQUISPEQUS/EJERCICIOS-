# Instalar las librerías necesarias (si aún no están instaladas)
# install.packages("ggplot2")

# Cargar librerías
library(ggplot2)

# Definir los datos
X <- c(1, 2, 3, 4, 5, 6, 7, 8, 9, 10)  # Años de antigüedad
Y <- c(15000, 14000, 13000, 12000, 11000, 10000, 9000, 8000, 7000, 6000)  # Valor de reventa

# Ajustar el modelo de regresión lineal
modelo <- lm(Y ~ X)

# Obtener las predicciones del modelo
Y_pred <- predict(modelo)

# Calcular el R^2
r2 <- summary(modelo)$r.squared
cat(sprintf("Coeficiente de correlación (R^2): %.2f\n", r2))

# Crear gráfico
data <- data.frame(X, Y, Y_pred)  # Crear un data.frame para facilitar el gráfico
ggplot(data, aes(x = X, y = Y)) +
  geom_point(color = "blue", size = 3) +  # Puntos de datos reales
  geom_line(aes(x = X, y = Y_pred), color = "red", size = 1.5, linetype = "solid") +  # Línea de regresión
  labs(
    title = "Regresión lineal: Valor de reventa vs Años de antigüedad",
    x = "Años de antigüedad",
    y = "Valor de reventa"
  ) +
  theme_minimal() +
  theme(legend.position = "none")  
