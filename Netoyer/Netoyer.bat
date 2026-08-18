@echo off
:: 1. Fermer Texmaker pour libérer tous les fichiers et vider le visionneur intégré
taskkill /f /im texmaker.exe 2>nul

:: 1. Suppression des extensions spécifiques
del /s *.aux *.log *.synctex.gz *.synctex *.toc *.bbl *.blg *.out *.ilg *.ind

:: 2. Si un fichier .tex fait 0 Ko, supprimer le .tex et le .pdf associé
for /r %%i in (*.tex) do (
    if %%~zi==0 (
        del /q "%%i"
        if exist "%%~dpni.pdf" del /q "%%~dpni.pdf"
    )
)

:: 3. Suppression de TOUS les autres fichiers de 0 Ko
for /r %%i in (*) do if %%~zi==0 del /q "%%i"

exit
