<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:tei="http://www.tei-c.org/ns/1.0"
    xpath-default-namespace="http://www.tei-c.org/ns/1.0" exclude-result-prefixes="xs tei"
    version="2.0">
    <xsl:output method="html" indent="yes" encoding="UTF-8"/>
    <xsl:strip-space elements="*"/>

    <xsl:variable name="witfile">
        <xsl:value-of select="replace(base-uri(.), 'Edition_JeanFroissart.xml', '')"/>
        <!-- récupération du nom et du chemin du fichier courant -->
    </xsl:variable>
    
    <!-- Page Html -->
    <xsl:variable name="accueil">
        <xsl:value-of select="concat($witfile,'HTML/homepage','.html')"/>
    </xsl:variable>
    <xsl:variable name="apropos">
        <xsl:value-of select="concat($witfile,'HTML/about','.html')"/>
    </xsl:variable>
    <xsl:variable name="manifeste">
        <xsl:value-of select="concat($witfile,'HTML/manifeste','.html')"/>
    </xsl:variable>
    
    <!--  -->
    <xsl:variable name="title">
        <xsl:value-of select="//fileDesc/titleStmt/title"/>
    </xsl:variable>
    
    <xsl:template match="/">
            
        <xsl:result-document href="{$accueil}" method="html" indent="yes">
            <html>
                <head>
                    <xsl:call-template name="metadata"/>
                    <title>
                        <xsl:value-of select="concat($title, ' | Accueil')"/>
                    </title>
                    <style>
                        p.h1{
                        font-family: 'MedievalSharp', cursive;
                        }
                        .h1, .h3{
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
                                <figcaption style="text-align:center; margin-top: 1em;  font-size: 12px"> Tandis qu'ils tentent de prendre la forteresse du marché de Meaux où est retranchée la famille du dauphin Charles, les jacques et leurs alliés parisiens sont surpris par une charge de chevalerie de Gaston Phébus et Jean de Grailli (9 juin 1358). Jean Froissart, <i><span style="color: #EF0107;">C</span>hroniques</i>, Flandre, Bruges, XVe s., folio 226, verso (BNF, ms. Français 2643).</figcaption>
                            </figure>
                            <hr/>
                            <div style="text-align: left;">
                                <p class="h3">Préambule</p>
                                <p>
                                    Ce travail d'édition scientifique a été produit dans le cadre du Master 2 <i>Technologies numériques appliquées à l'histoire</i> dispensé à l'Ecole nationale des Chartes. L'encodage XML-TEI a été réalisé par <xsl:value-of select="concat(//respStmt[@xml:id='Encodeur']/descendant::surname, ', ',//respStmt[@xml:id='Encodeur']/descendant::forename, ' (', //respStmt[@xml:id='Encodeur']/descendant::affiliation, ')')"/> sous la direction de <xsl:value-of select="concat(//respStmt[@xml:id='Responsable']/descendant::surname, ', ',//respStmt[@xml:id='Responsable']/descendant::forename, ' (', //respStmt[@xml:id='Responsable']/descendant::affiliation, ')')"/>.
                                    <xsl:value-of select="//editorialDecl/descendant::p[1]"/>
                                    <ul class="text-sm-start">
                                        <li><xsl:value-of select="concat(//witness[@xml:id='NY']/descendant::msName, ', ',//witness[@xml:id='NY']/descendant::idno, ', ',//witness[@xml:id='NY']/descendant::institution)"/></li>
                                        <li><xsl:value-of select="concat(//witness[@xml:id='Cou']/descendant::msName, ', ',//witness[@xml:id='Cou']/descendant::idno, ', ',//witness[@xml:id='Cou']/descendant::institution)"/></li>
                                        <li><xsl:value-of select="concat(//witness[@xml:id='Pa']/descendant::msName, ', ',//witness[@xml:id='Pa']/descendant::idno[1], ', ',//witness[@xml:id='Pa']/descendant::institution)"/></li>
                                    </ul>
                                </p>
                                <p>Ce récit en prose de la fin du XIVe siècle contistue une source précieuse et inédite sur la guerre de Cent Ans (1337-1453) et les crises politiques au sein des monarchies occidentales durant le Bas Moyen-Age. Les <i><span style="color: #EF0107;">C</span>hroniques</i> s'ouvrent sur les événements qui ont précédé la déposition d'Édouard II en 1326 et couvrent la période allant jusqu'à 1400, en rapportant principalement les confictualités entre les royaumes britannique et français sous fond de crise de la féodalité.
                                    L'extrait traite de l'année 1328 où se déroule la succession du roi de France suite à la mort de Charles IV le Bel, qui dans le cadre de la loi revient à Philippe de Valois. Ce changement de maison royal intervient dans le cadre de la guerre de Cent Ans et d'une révolte des milices flamandes contre le comte de Flandre Louis de Nevers. La bataille de Cassel dont la victoire des armées du roi permet le rétablissement de l'autorité seigneuriale.</p>
                                <p>Bonne visite !</p>
                            </div>
                        </div>
                    </div>
                    <xsl:call-template name="footer"/>
                </body>
            </html>
        </xsl:result-document>
        
        <xsl:result-document href="{$apropos}" method="html" indent="yes">
            <html>
                <head>
                    <xsl:call-template name="metadata"/>
                    <title>
                        <xsl:value-of select="concat($title, ' | A propos')"/>
                    </title>
                </head>
                <body>
                    <xsl:call-template name="navbar"/>
                    <div class="container">
                        <p class="h1">A propos de l'édition</p>
                        <figure>
                            <a href="https://gallica.bnf.fr/ark:/12148/btv1b8438607b/f292.item">
                                <img class="rounded mx-auto d-block"
                                    src="./img/charlesVI.jpg"
                                    style="width: 50%; height: 70%"/>
                            </a>
                            <figcaption style="text-align:center; margin-top: 1em;  font-size: 12px"> Folie de Charles VI : traversant la forêt du Mans lors d'une expédition contre Pierre de Craon, le roi, brandissant une épée, prend les membres de sa suite pour des ennemis et les attaque, XVe,  fol. 153v (BNF, Français 2646)  </figcaption>
                        </figure>
                        <hr/>
                        <p class="h4">Source</p>
                        <p>La mise en place de cette édition numérique s'appuie sur l'édition critique <a href="https://www.dhi.ac.uk/onlinefroissart/" target="_blank"><xsl:value-of select="//sourceDesc/descendant::title[1]"/></a>
                            édité par Ainsworth, Peter( dir.) et Croenen, Godfried (dir.) et publié par l'University of Sheffield et l'University of Liverpool en 2013. Le projet Froissart en ligne vise à fournir aux chercheurs une 
                            ressource complète pour l'étude des <i><span style="color: #EF0107;">C</span>hroniques</i> en s'appuyant sur plus de 150 manuscrits. Selon la description de la dernière version, 4 364 000 mots ont été transcrits à partir de 15 162 pages manuscrites.
                            Une description codicologique détaillée est proposée pour onze manuscrits, et les projets visent à en créer une pour chacun des 113 témoins dont la périnisation des données est permise car à la mise l'encodage
                            TEI.
                        </p>
                        <p class="h4">Méthodologie</p>
                        <p>L'encodage a été réalisé selon la méthode de "<xsl:value-of select="//variantEncoding/@method"/>". L'apparat critique a été constitué comme sélectif, excluant la ponctuation, et comme positif en faisant figurer systématiquement l'ensemble des témoins.
                            Il a été déterminé grâce à l'application <a href="https://github.com/itsee-birmingham/standalone_collation_editor" target="_blank">Collatex</a> et de l'algorithme Dekker</p>
                        <div class="button"><a type="button" class="btn btn-outline-info" href="../Edition_JeanFroissart.xml" target="_blank">XML-TEI</a><a type="button" class="btn btn-outline-secondary" href="../docs/JeanFroissart_ODD.html" target="_blank">ODD</a></div>
                    </div>      
                    <xsl:call-template name="footer"/>
                </body>
            </html>
        </xsl:result-document>
        <xsl:result-document href="{$manifeste}" method="html" indent="yes">
            <html>
                <head>
                    <xsl:call-template name="metadata"/>
                    <title>
                        <xsl:value-of select="concat($title, ' | manifeste')"/>
                    </title>
                </head>
                <body>
                    <xsl:call-template name="navbar"/>
                    <xsl:call-template name="manuscrit"/>  
                    <xsl:call-template name="footer"/>
                </body>
            </html>
        </xsl:result-document>
    </xsl:template>
    
    
    <!-- Templates structures HTML -->    
    <xsl:template name="metadata">
                <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
                <meta name="description"
                    content="Projet d'édition numérique du roman-feuilleton les Fils de famille d'Eugène Sue (1856)"/>
                <meta name="keywords" content="edition, tei, xslt, chroniques, Jean, Froissart"/>
                <meta name="author" content="Humeau, Maxime"/>
                <link rel="icon" type="image/png" href="img/brand.png" />
                <link href="https://fonts.googleapis.com/css2?family=MedievalSharp" rel="stylesheet"/>
                <style>
                    .h1{
                    text-align: center;
                    }
                    .h1, .h2, .h3, .h4, .h5{
                    margin: 10px;
                    }
                    div.button{
                        display: flex;
                        justify-content: center;
                        margin : 10px;
                    }
                </style>
                <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous"/>
                <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
                <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.3/umd/popper.min.js"></script>
                <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js"></script>
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>   
    </xsl:template>
    
    <!--Template navbar-->
    <xsl:template name="navbar">
        <nav class="navbar navbar-expand-lg navbar-dark sticky-top" style="background-color: #4169E1;">
            <a class="navbar-brand" href="./homepage.html" style="margin-left: 1em;"> <img class="d-inline-block" src="./img/brand.png" width="60" height="60" alt=""/>Accueil</a>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mr-auto mt-2 mt-lg-0">
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
                        <a class="nav-link" href="./manifeste.html">notices</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="./about.html">À propos</a>
                    </li>
                </ul>
            </div>
        </nav>
    </xsl:template>
    
    <!--Template footer -->
    <xsl:template name="footer">
        <br/>
        <br/>
        <br/>
        <footer class="text-center text-dark fixed-bottom footer-transparent">
            <div class="text-center p-1" style="background-color: #4169E1;">
                <p class="text-light">© MIT Licence | Humeau Maxime - 2022 : <a
                    class="text-light" href="https://github.com/rayondemiel"
                        target="_blank">Github</a></p>
            </div>
        </footer>
    </xsl:template>
    
    <!-- Template notice manuscrit (css s'appuie sur l'édition numérique de Segolene Albouy - lien github: https://github.com/Segolene-Albouy/Segolene-Albouy.github.io -->
    <xsl:template name="manuscrit">
            <xsl:variable name="id">
                <xsl:text>NY</xsl:text>
            </xsl:variable>
        <div id="{$id}" class="container">
                <h1 class="p-3">
                    <xsl:text>Manuscrit </xsl:text>
                    <em>
                        (<xsl:value-of select="//witness[@xml:id=$id]/descendant::msIdentifier/idno"/>)
                    </em>
                </h1>
                <div class="row">
                    <!-- Informations générales du manuscrit -->
                    <div class="card col-md-3 col-sm-5 p-3">
                        <div id="general" class="text-center">
                            <h4><xsl:value-of select="//witness[@xml:id=$id]/descendant::msIdentifier/institution"/></h4>
                            <xsl:apply-templates select="//witness[@xml:id=$id]/descendant::msIdentifier"/>
                        </div>
                        <hr/>
                        <div id="id" class="p-1">
                            <h5>Identifiants</h5>
                            <p>
                                <b>Cote : <xsl:value-of select="//witness[@xml:id=$id]/descendant::msIdentifier/idno"/></b>
                            </p>
                            <xsl:if test="//witness[@xml:id=$id]/descendant::altIdentifier">
                                    <xsl:apply-templates select="//witness[@xml:id=$id]/descendant::altIdentifier"/>
                            </xsl:if>
                            <p>
                                <xsl:variable name="lien">
                                    <xsl:value-of select="//witness[@xml:id=$id]/msDesc/@facs"/>
                                </xsl:variable>
                                <a href="{$lien}" target="_blank">Lien</a>
                            </p>
                        </div>
                        <hr/>
                        <div id="summary" class="p-1">
                            <h5>Sommaire</h5>
                            <div class="container">
                                <xsl:value-of  select="//witness[@xml:id=$id]/descendant::summary"/>
                            </div>
                        </div>
                    </div>
                    
                    <!-- Informations spécifiques aux vies de saints -->
                    <div class="container col-md-8 col-sm-7">
                        <h3>
                            <xsl:value-of select="//witness[@xml:id=$id]/descendant::msName"/>
                        </h3>
                        <div class="container">
                            <p>
                                <xsl:value-of select="//witness[@xml:id=$id]/descendant::textLang"/>
                                <xsl:text> - </xsl:text>
                                <b>
                                    <xsl:value-of select="//witness[@xml:id=$id]/descendant::head/origDate"/>
                                </b>
                                <br/>
                            </p>
                            <hr/>
                            <div id="extrait" class="p-1">
                                <h5>Extrait</h5>
                                <div class="container">
                                    <xsl:apply-templates select="//witness[@xml:id=$id]/descendant::msItemStruct"></xsl:apply-templates>
                                </div>
                            </div>
                            <hr/>
                            <div id="resp" class="p-1">
                                <h5>Intervenants</h5>
                                <div class="container">
                                    <xsl:apply-templates select="//witness[@xml:id=$id]/descendant::author"/>
                                </div>
                            </div>
                            <hr/>
                            <div id="colophon" class="p-1">
                                <h5>Colophon</h5>
                                <div class="container">
                                    <em>
                                        <xsl:value-of select="//witness[@xml:id=$id]/descendant::colophon"/>
                                    </em>
                                </div>
                            </div>
                            <hr/>
                            <div id="physDesc" class="p-1">
                                <h3>Description matérielle</h3>
                                <div class="container">
                                    <b>Support</b>
                                    <xsl:value-of select="concat(' : ', //witness[@xml:id=$id]/descendant::support)"/>
                                    <br/>
                                    <b>Dimension</b>
                                    <xsl:value-of
                                        select="concat(' : largeur : ', //witness[@xml:id=$id]/descendant::extent/width/@unit, ' ; longueur : ', //witness[@xml:id=$id]/descendant::extent/height/@unit)"/>
                                    <br/>
                                    <b>Foliotation</b>
                                    <xsl:value-of select="concat(' : ', //witness[@xml:id=$id]/descendant::physDesc//foliation)"/>
                                    <br/>
                                    <b>Mise en page</b>
                                    <xsl:choose>
                                        <xsl:when test="//witness[@xml:id=$id]/descendant::layoutDesc//layout/@columns > 1">
                                            <xsl:value-of
                                                select="concat(' : colonnes : ', //witness[@xml:id=$id]/descendant::layoutDesc//layout/@columns)"
                                            />
                                        </xsl:when>
                                        <xsl:otherwise>
                                            <xsl:value-of
                                                select="concat(' : colonne : ', //witness[@xml:id=$id]/descendant::layoutDesc//layout/@columns)"
                                            />
                                        </xsl:otherwise>
                                    </xsl:choose>
                                    <xsl:value-of
                                        select="concat(' ; lignes par colonne : ', //witness[@xml:id=$id]/descendant::physDesc//layout/@writtenLines)"/>
                                    <br/>
                                    <xsl:value-of select="//witness[@xml:id=$id]/descendant::physDesc//layout"/>
                                    <hr/>
                                    <b>Description des mains</b>
                                    <xsl:value-of select="concat(' : ', //witness[@xml:id=$id]/descendant::handNote//p)"/>
                                    <xsl:if test="//witness[@xml:id=$id]/descendant::handNote//list">
                                        <xsl:apply-templates select="//witness[@xml:id=$id]/descendant::handNote//list/item"/>
                                    </xsl:if>
                                    <hr/>
                                    <b>Description de l'écriture</b>
                                    <xsl:value-of select="concat(' : ', //witness[@xml:id=$id]/descendant::scriptNote)"/>
                                    <hr/>
                                    <b>Description de l'ornement</b>
                                    <xsl:text> :</xsl:text>
                                    <xsl:apply-templates select="//witness[@xml:id=$id]/descendant::decoDesc//decoNote"/>
                                    <hr/>
                                    <b>Description de l'ornement</b>
                                    <xsl:text> :</xsl:text>
                                    <br/>
                                    <xsl:apply-templates select="//witness[@xml:id=$id]/descendant::bindingDesc//decoNote"/>
                                    <hr/>
                                    <b>Provenance géographique</b>
                                    <xsl:text> :</xsl:text>
                                    <br/>
                                    <xsl:apply-templates select="//witness[@xml:id=$id]/descendant::history/origin/p"/>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
        </div>
    </xsl:template>
    
    <xsl:template match="author">
        <xsl:value-of select="concat(./surname, ', ',./forename)"/>
    </xsl:template>
    
    <xsl:template match="msIdentifier">
        <p>
            <dl>
                <dt>Departement</dt><dd><xsl:value-of select="./repository"/></dd>
                <dt>Collection</dt><dd><xsl:value-of select="./collection"/></dd>
                <dt>Localisation</dt><dd><xsl:value-of select="concat(./country, ', ', ./settlement)"/></dd>
            </dl>
        </p>
    </xsl:template>
    
    <xsl:template match="altIdentifier">
        <p> Ancien(s) identifiant(s) :
            <ul>
                <xsl:for-each select=".//idno">
                    <li><xsl:value-of select="./idno"/></li>
                </xsl:for-each>
            </ul>
        </p>
    </xsl:template>
    
    <xsl:template match="msItemStruct">
        <p>"<i style="color: #EF0107;"><xsl:value-of select="./title"/></i>" - <xsl:value-of select="./locus"/>
            <dl>
                <dt>Incipit</dt><dd><i>"<xsl:value-of select="./incipit"/>"</i></dd>
                <dt>Explicit</dt><dd><i>"<xsl:value-of select="./explicit"/>"</i></dd>
                <dt></dt><dd></dd>
            </dl>
        </p>
    </xsl:template>
    
</xsl:stylesheet>