<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:tei="http://www.tei-c.org/ns/1.0"
    xpath-default-namespace="http://www.tei-c.org/ns/1.0" exclude-result-prefixes="xs tei"
    version="2.0">
    <xsl:output method="html" indent="yes" encoding="UTF-8"/>
    <xsl:strip-space elements="*"/>
    
    
    <xsl:template match="/">
        <xsl:variable name="witfile">
            <xsl:value-of select="replace(base-uri(.), 'Edition_JeanFroissart.xml', '')"/>
            <!-- récupération du nom et du chemin du fichier courant -->
        </xsl:variable>
        <xsl:variable name="accueil">
            <xsl:value-of select="concat($witfile,'HTML/homepage','.html')"/>
        </xsl:variable>
        
        <xsl:variable name="title">
                <xsl:value-of select="concat(//titleStmt/title, ', ', //titleStmt//author/forename, ' ', //titleStmt//author/surname)"/>
        </xsl:variable>
        
        <xsl:result-document href="{$accueil}" method="html" indent="yes">
            <html>
                <head>
                    <xsl:call-template name="metadata"/>
                    <xsl:value-of select="concat($title, ' | Accueil')"/>>
                </head>
                <body>
                    <xsl:call-template name="navbar"/>
                    <div class="container">
                        <div style="text-align: center; padding-top: 20px;">
                            <p>Bienvenue au sein du projet d'édition numérique des
                                <i>Chroniques</i> de Jean Froissart</p>
                            <p>
                                <xsl:value-of select="//encodingDesc"/>
                            </p>
                            <p>Cette édition numérique offre la possibilité d'explorer trois manuscrits témoins basés sur l'oeuvre de Jean Froissart
                            <ul>
                                <li><xsl:value-of select="concat(//titleStmt/title, ', ', //titleStmt//author/forename, ' ', //titleStmt//author/surname)"/></li>
                            </ul></p>
                            <p>Vous pouvez naviguer à travers le projet grâce à la barre de
                                navigation en haut de cette page. Bonne visite !</p>
                        </div>
                    </div>
                </body>
            </html>
        </xsl:result-document>
    </xsl:template>
    
    <xsl:template name="metadata">
                <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
                <meta name="description"
                    content="Projet d'édition numérique du roman-feuilleton les Fils de famille d'Eugène Sue (1856)"/>
                <meta name="keywords" content="edition, tei, xslt, chroniques, Jean, Froissart"/>
                <meta name="author" content="Humeau, Maxime"/>
                <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous"/>
                <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
                <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.3/umd/popper.min.js"></script>
                <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js"></script>
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>   
    </xsl:template>
    
    <xsl:template name="navbar"></xsl:template>
    
    
</xsl:stylesheet>