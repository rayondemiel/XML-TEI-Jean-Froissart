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
                <xsl:value-of select="//fileDesc/titleStmt/title"/>
        </xsl:variable>
        
        <xsl:result-document href="{$accueil}" method="html" indent="yes">
            <html>
                <head>
                    <xsl:call-template name="metadata"/>
                    <title>
                        <xsl:value-of select="concat($title, ' | Accueil')"/>
                    </title>
                    <link href="https://fonts.googleapis.com/css2?family=MedievalSharp" rel="stylesheet"/>
                    <style>
                        p.h1{
                        font-family: 'MedievalSharp', cursive;
                        }
                        .h1, .h2, .h3, .h4, .h5{
                        text-align: center;
                        margin-bottom: 10px;
                        }
                    </style>
                </head>
                <body>
                    <xsl:call-template name="navbar"/>
                    <div class="container">
                        <div style="padding-top: 20px;">
                            <p class="h1">Projet d'édition numérique des
                                <i><span style="color: #EF0107;">C</span>hroniques</i> de Jean Froissart</p>
                            <figure>
                                <a href="https://gallica.bnf.fr/ark:/12148/btv1b84386043/f476.item">
                                    <img class="rounded mx-auto d-block"
                                        src="./img/jacquerie.jpg"
                                        style="width: 38rem; height: auto"/>
                                </a>
                                <figcaption style="text-align:center; margin-top: 1em;  font-size: 12px"> Tandis qu'ils tentent de prendre la forteresse du marché de Meaux où est retranchée la famille du dauphin Charles, les jacques et leurs alliés parisiens sont surpris par une charge de chevalerie de Gaston Phébus et Jean de Grailli (9 juin 1358). Jean Froissart, <i>Chroniques</i>, Flandre, Bruges, XVe s., folio 226, verso (BNF, ms. Français 2643).</figcaption>
                            </figure>
                            <hr/>
                            <div style="text-align: left;">
                                <p class="h3">Presentation du travail éditorial</p>
                                <p>
                                    Ce travail d'édition scientifique a été produit dans le cadre du Master 2 <i>Technologies numériques appliquées à l'histoire</i> dispensé à l'Ecole nationale des Chartes. 
                                    <xsl:value-of select="//editorialDecl/descendant::p[1]"/>
                                    <ul class="text-sm-start">
                                        <li><xsl:value-of select="concat(//witness[@xml:id='NY']/descendant::msName, ', ',//witness[@xml:id='NY']/descendant::idno, ', ',//witness[@xml:id='NY']/descendant::institution)"/></li>
                                        <li><xsl:value-of select="concat(//witness[@xml:id='Cou']/descendant::msName, ', ',//witness[@xml:id='Cou']/descendant::idno, ', ',//witness[@xml:id='Cou']/descendant::institution)"/></li>
                                        <li><xsl:value-of select="concat(//witness[@xml:id='Pa']/descendant::msName, ', ',//witness[@xml:id='Pa']/descendant::idno[1], ', ',//witness[@xml:id='Pa']/descendant::institution)"/></li>
                                    </ul>
                                    
                                </p>
                                <p>Vous pouvez naviguer à travers le projet grâce à la barre de
                                    navigation en haut de cette page. Bonne visite !</p>
                            </div>
                        </div>
                    </div>
                    <xsl:call-template name="footer"/>
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
    
    <xsl:template name="navbar">
        <nav class="navbar navbar-expand-lg navbar-dark sticky-top" style="background-color: #4169E1;">
            <a class="navbar-brand" href="./homepage.html" style="margin-left: 1em;"> <img class="d-inline-block" src="./img/brand.png" width="70" height="70" alt=""/>Accueil</a>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mr-auto mt-2 mt-lg-0">
                    <li class="nav-item active">
                        <a class="nav-link" href="{{url_for('accueil')}}">Accueil</a>
                    </li>
                    <li class="nav-item dropdown nav-item">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            Base de données
                        </a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <a class="dropdown-item" href="{{url_for('index_militant')}}">Index des militants écologistes</a>
                            <a class="dropdown-item" href="{{url_for('index_objContest')}}">Index des projets contestés</a>
                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item" href="{{url_for('index_organisation')}}">Index des Organisations</a>
                        </div>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="{{url_for('carte')}}">Carte</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">À propos</a>
                    </li>
                </ul>
            </div>
        </nav>
    </xsl:template>
    
    <xsl:template name="footer">
        <footer class="text-center text-dark fixed-bottom footer-transparent">
            <div class="text-center p-1" style="background-color: #4169E1;">
                <p class="text-light">© MIT Licence | Humeau Maxime - 2022 : <a
                    class="text-light" href="https://github.com/rayondemiel"
                        target="_blank">Github</a></p>
            </div>
        </footer>
    </xsl:template>
    
    <xsl:template match="msName">
        <xsl:element name="i">
            <xsl:value-of select="."/>
        </xsl:element>
        <xsl:apply-templates select="."/>
    </xsl:template>
    
</xsl:stylesheet>