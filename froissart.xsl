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

    <!-- Variable Page Html -->
    <xsl:variable name="accueil">
        <xsl:value-of select="concat($witfile, 'HTML/homepage', '.html')"/>
    </xsl:variable>
    <xsl:variable name="apropos">
        <xsl:value-of select="concat($witfile, 'HTML/about', '.html')"/>
    </xsl:variable>
    <xsl:variable name="manifeste">
        <xsl:value-of select="concat($witfile, 'HTML/manifeste', '.html')"/>
    </xsl:variable>
    <xsl:variable name="index">
        <xsl:value-of select="concat($witfile, 'HTML/index', '.html')"/>
    </xsl:variable>
    <xsl:variable name="msNY">
        <xsl:value-of select="concat($witfile, 'HTML/ms_ny', '.html')"/>
    </xsl:variable>
    <xsl:variable name="msPa">
        <xsl:value-of select="concat($witfile, 'HTML/ms_pa', '.html')"/>
    </xsl:variable>
    <xsl:variable name="msCou">
        <xsl:value-of select="concat($witfile, 'HTML/ms_cou', '.html')"/>
    </xsl:variable>

    <!--  -->
    <xsl:variable name="title">
        <xsl:value-of select="//fileDesc/titleStmt/title"/>
    </xsl:variable>

    <!--###############################
    ############# HTML #############
    ###############################-->

    <xsl:template match="/">
        <!-- Page accueil -->
        <xsl:result-document href="{$accueil}" method="html" indent="yes">
            <html>
                <head>
                    <xsl:call-template name="metadata"/>
                    <title>
                        <xsl:value-of select="concat($title, ' | Accueil')"/>
                    </title>
                    <style>
                        p.h1 {
                            font-family: 'MedievalSharp', cursive;
                        }
                        .h1,
                        .h3 {
                            text-align: center;
                            margin-bottom: 10px;
                        }</style>
                </head>
                <body>
                    <xsl:call-template name="navbar"/>
                    <div class="container">
                        <div style="padding-top: 20px;">
                            <p class="h1">Projet d'édition numérique des <i><span
                                        style="color: #EF0107;">C</span>hroniques</i> de Jean
                                Froissart</p>
                            <figure>
                                <a href="https://gallica.bnf.fr/ark:/12148/btv1b84386043/f476.item">
                                    <img class="rounded mx-auto d-block" src="./img/jacquerie.jpg"
                                        style="width: 38rem; height: auto"/>
                                </a>
                                <figcaption
                                    style="text-align:center; margin-top: 1em;  font-size: 12px">
                                    Tandis qu'ils tentent de prendre la forteresse du marché de
                                    Meaux où est retranchée la famille du dauphin Charles, les
                                    jacques et leurs alliés parisiens sont surpris par une charge de
                                    chevalerie de Gaston Phébus et Jean de Grailli (9 juin 1358).
                                    Jean Froissart, <i><span style="color: #EF0107;"
                                        >C</span>hroniques</i>, Flandre, Bruges, XVe s., folio 226,
                                    verso (BNF, ms. Français 2643).</figcaption>
                            </figure>
                            <hr/>
                            <div style="text-align: left;">
                                <p class="h3">Préambule</p>
                                <p> Ce travail d'édition scientifique a été produit dans le cadre du
                                    Master 2 <i>Technologies numériques appliquées à l'histoire</i>
                                    dispensé à l'Ecole nationale des Chartes. L'encodage XML-TEI a
                                    été réalisé par <xsl:value-of
                                        select="concat(//respStmt[@xml:id = 'Encodeur']/descendant::surname, ', ', //respStmt[@xml:id = 'Encodeur']/descendant::forename, ' (', //respStmt[@xml:id = 'Encodeur']/descendant::affiliation, ')')"
                                    /> sous la direction de <xsl:value-of
                                        select="concat(//respStmt[@xml:id = 'Responsable']/descendant::surname, ', ', //respStmt[@xml:id = 'Responsable']/descendant::forename, ' (', //respStmt[@xml:id = 'Responsable']/descendant::affiliation, ')')"
                                    />. <xsl:value-of select="//editorialDecl/descendant::p[1]"/>
                                    <ul class="text-sm-start">
                                        <li><xsl:value-of
                                                select="concat(//witness[@xml:id = 'NY']/descendant::msName, ', ', //witness[@xml:id = 'NY']/descendant::idno, ', ', //witness[@xml:id = 'NY']/descendant::institution)"
                                            /></li>
                                        <li><xsl:value-of
                                                select="concat(//witness[@xml:id = 'Cou']/descendant::msName, ', ', //witness[@xml:id = 'Cou']/descendant::idno, ', ', //witness[@xml:id = 'Cou']/descendant::institution)"
                                            /></li>
                                        <li><xsl:value-of
                                                select="concat(//witness[@xml:id = 'Pa']/descendant::msName, ', ', //witness[@xml:id = 'Pa']/descendant::idno[1], ', ', //witness[@xml:id = 'Pa']/descendant::institution)"
                                            /></li>
                                    </ul>
                                </p>
                                <p>Ce récit en prose de la fin du XIVe siècle contistue une source
                                    précieuse et inédite sur la guerre de Cent Ans (1337-1453) et
                                    les crises politiques au sein des monarchies occidentales durant
                                    le Bas Moyen-Age. Les <i><span style="color: #EF0107;"
                                        >C</span>hroniques</i> s'ouvrent sur les événements qui ont
                                    précédé la déposition d'Édouard II en 1326 et couvrent la
                                    période allant jusqu'à 1400, en rapportant principalement les
                                    confictualités entre les royaumes britannique et français sous
                                    fond de crise de la féodalité. L'extrait traite de l'année 1328
                                    où se déroule la succession du roi de France suite à la mort de
                                    Charles IV le Bel, qui dans le cadre de la loi revient à
                                    Philippe de Valois. Ce changement de maison royal intervient
                                    dans le cadre de la guerre de Cent Ans et d'une révolte des
                                    milices flamandes contre le comte de Flandre Louis de Nevers. La
                                    bataille de Cassel dont la victoire des armées du roi permet le
                                    rétablissement de l'autorité seigneuriale.</p>
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
                                <img class="rounded mx-auto d-block" src="./img/charlesVI.jpg"
                                    style="width: 50%; height: 70%"/>
                            </a>
                            <figcaption style="text-align:center; margin-top: 1em;  font-size: 12px"
                                > Folie de Charles VI : traversant la forêt du Mans lors d'une
                                expédition contre Pierre de Craon, le roi, brandissant une épée,
                                prend les membres de sa suite pour des ennemis et les attaque, XVe,
                                fol. 153v (BNF, Français 2646) </figcaption>
                        </figure>
                        <hr/>
                        <p class="h4">Source</p>
                        <p>La mise en place de cette édition numérique s'appuie sur l'édition
                            critique <a href="https://www.dhi.ac.uk/onlinefroissart/"
                                target="_blank"><xsl:value-of
                                    select="//sourceDesc/descendant::title[1]"/></a> édité par
                            Ainsworth, Peter( dir.) et Croenen, Godfried (dir.) et publié par
                            l'University of Sheffield et l'University of Liverpool en 2013. Le
                            projet Froissart en ligne vise à fournir aux chercheurs une ressource
                            complète pour l'étude des <i><span style="color: #EF0107;"
                                >C</span>hroniques</i> en s'appuyant sur plus de 150 manuscrits.
                            Selon la description de la dernière version, 4 364 000 mots ont été
                            transcrits à partir de 15 162 pages manuscrites. Une description
                            codicologique détaillée est proposée pour onze manuscrits, et les
                            projets visent à en créer une pour chacun des 113 témoins dont la
                            périnisation des données est permise car à la mise l'encodage TEI. </p>
                        <p class="h4">Méthodologie</p>
                        <p>L'encodage a été réalisé selon la méthode de "<xsl:value-of
                                select="//variantEncoding/@method"/>". L'apparat critique a été
                            constitué comme sélectif, excluant la ponctuation, et comme positif en
                            faisant figurer systématiquement l'ensemble des témoins. Il a été
                            déterminé grâce à l'application <a
                                href="https://github.com/itsee-birmingham/standalone_collation_editor"
                                target="_blank">Collatex</a> et de l'algorithme Dekker</p>
                        <div class="button">
                            <a type="button" class="btn btn-outline-info"
                                href="../Edition_JeanFroissart.xml" target="_blank">XML-TEI</a>
                            <a type="button" class="btn btn-outline-secondary"
                                href="../docs/JeanFroissart_ODD.html" target="_blank">ODD</a>
                        </div>
                    </div>
                    <xsl:call-template name="footer"/>
                </body>
            </html>
        </xsl:result-document>

        <!-- HTML notices bibliographiques des témoins -->
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
                    <div class="container">
                        <ul class="nav nav-tabs" id="myTab" role="tablist">
                            <li class="nav-item">
                                <a class="nav-link active" data-toggle="tab" href="#Cou" role="tab"
                                    >Cod. 329</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" data-toggle="tab" href="#NY" role="tab">MS
                                    M.804</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" data-toggle="tab" href="#Pa" role="tab">Français
                                    2663</a>
                            </li>
                        </ul>
                        <div class="tab-content" id="myTabContent">
                            <xsl:apply-templates select="//witness"/>
                        </div>
                    </div>
                    <xsl:call-template name="footer"/>
                </body>
            </html>
        </xsl:result-document>

        <!-- HTML des différents index -->
        <xsl:result-document href="{$index}" method="html" indent="yes">
            <html>
                <head>
                    <xsl:call-template name="metadata"/>
                    <title>
                        <xsl:value-of select="concat($title, ' | Index des Lieux')"/>
                    </title>
                </head>
                <body>
                    <xsl:call-template name="navbar"/>
                    <div class="container">
                        <ul class="nav nav-tabs" id="myTab" role="tablist">
                            <li class="nav-item">
                                <a class="nav-link active" data-toggle="tab" href="#indPers"
                                    role="tab">Personnages</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" data-toggle="tab" href="#indLieux" role="tab"
                                    >Lieux</a>
                            </li>
                        </ul>
                        <div class="tab-content" id="myTabContent">
                            <div class="tab-pane fade show active" id="indPers" role="tabpanel">
                                <h1 class="text-center"> Index des personnages </h1>
                                <div class="text-center">
                                    <i>@Cou : Manuscrit (Cod. 329); @Pa : Manuscrit (Français 2663);
                                        @NY : Manuscrit (MS M.804) </i>
                                </div>
                                <xsl:call-template name="listName"/>
                            </div>
                            <div class="tab-pane fade" id="indLieux" role="tabpanel">
                                <h1 class="text-center"> Index des lieux </h1>
                                <div class="text-center">
                                    <i>@Cou : Manuscrit (Cod. 329); @Pa : Manuscrit (Français 2663);
                                        @NY : Manuscrit (MS M.804) </i>
                                </div>
                                <xsl:call-template name="listPlace"/>
                            </div>
                        </div>
                    </div>
                    <xsl:call-template name="footer"/>
                </body>
            </html>
        </xsl:result-document>

        <!-- Editions des manuscrits -->

        <!-- Manuscrit New York -->
        <xsl:result-document href="{$msNY}" method="html" indent="yes">
            <html>
                <head>
                    <xsl:call-template name="metadata"/>
                    <title>
                        <xsl:value-of select="concat($title, ' | Manuscrit')"/>
                    </title>
                    <style>
                        p {
                            font-family: 'MedievalSharp', cursive;
                        }</style>
                </head>
                <body>
                    <xsl:call-template name="navbar"/>
                    <div class="container">
                        <h1 class="text-center"> Manuscrit <em>(MS M.804)</em></h1>
                        <div class="text-center">
                            <i>
                                <xsl:value-of
                                    select="concat(//witness[@xml:id = 'NY']/descendant::msIdentifier/institution, ', ', //witness[@xml:id = 'NY']/descendant::msIdentifier/country, ', ', //witness[@xml:id = 'NY']/descendant::msIdentifier/settlement)"
                                />
                            </i>
                        </div>
                        <br/>
                        <xsl:for-each select="//body/div[@type = 'section']">
                            <div class="block_p">
                                <xsl:apply-templates select="./head[@type = 'titre']"
                                    mode="titre_ny"/>
                                <xsl:apply-templates select="p" mode="text_ny"/>
                                <xsl:if test="./figure">
                                    <xsl:variable name="ref" select="./figure/graphic/@url"/>
                                    <figure>
                                        <a href="{$ref}">
                                            <img class="rounded mx-auto d-block"
                                                src="./img/cassel.jpg"
                                                style="width: 38rem; height: auto"/>
                                        </a>
                                        <figcaption
                                            style="text-align:center; margin-top: 1em;  font-size: 12px">
                                            <xsl:value-of select="./figure/head"/>
                                        </figcaption>
                                    </figure>
                                </xsl:if>
                            </div>
                        </xsl:for-each>
                    </div>
                    <xsl:call-template name="footer"/>
                </body>
            </html>
        </xsl:result-document>

        <!-- Manuscrit BNF -->
        <xsl:result-document href="{$msPa}" method="html" indent="yes">
            <html>
                <head>
                    <xsl:call-template name="metadata"/>
                    <title>
                        <xsl:value-of select="concat($title, ' | Manuscrit')"/>
                    </title>
                    <style>
                        p {
                            font-family: 'MedievalSharp', cursive;
                        }</style>
                </head>
                <body>
                    <xsl:call-template name="navbar"/>
                    <div class="container">
                        <h1 class="text-center"> Manuscrit <em>(MS Français 2663)</em></h1>
                        <div class="text-center">
                            <i>
                                <xsl:value-of
                                    select="concat(//witness[@xml:id = 'Pa']/descendant::msIdentifier/institution, ', ', //witness[@xml:id = 'Pa']/descendant::msIdentifier/country, ', ', //witness[@xml:id = 'Pa']/descendant::msIdentifier/settlement)"
                                />
                            </i>
                        </div>
                        <br/>
                        <xsl:for-each select="//body/div[@type = 'section']">
                            <div class="block_p">
                                <xsl:apply-templates select="./head[@type = 'titre']"
                                    mode="titre_pa"/>
                                <xsl:apply-templates select="p" mode="text_pa"/>
                            </div>
                        </xsl:for-each>
                    </div>
                    <xsl:call-template name="footer"/>
                </body>
            </html>
        </xsl:result-document>

        <!-- Manuscrit Coutrai -->
        <xsl:result-document href="{$msCou}" method="html" indent="yes">
            <html>
                <head>
                    <xsl:call-template name="metadata"/>
                    <title>
                        <xsl:value-of select="concat($title, ' | Manuscrit')"/>
                    </title>
                    <style>
                        p {
                            font-family: 'MedievalSharp', cursive;
                        }</style>
                </head>
                <body>
                    <xsl:call-template name="navbar"/>
                    <div class="container">
                        <h1 class="text-center"> Manuscrit <em>(MS Cod. 329))</em></h1>
                        <div class="text-center">
                            <i>
                                <xsl:value-of
                                    select="concat(//witness[@xml:id = 'Cou']/descendant::msIdentifier/institution, ', ', //witness[@xml:id = 'Cou']/descendant::msIdentifier/country, ', ', //witness[@xml:id = 'Cou']/descendant::msIdentifier/settlement)"
                                />
                            </i>
                        </div>
                        <br/>
                        <xsl:for-each select="//body/div[@type = 'section']">
                            <div class="block_p">
                                <xsl:apply-templates select="./head[@type = 'titre']"
                                    mode="titre_cou"/>
                                <xsl:apply-templates select="p" mode="text_cou"/>
                            </div>
                        </xsl:for-each>
                    </div>
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
        <link rel="icon" type="image/png" href="img/brand.png"/>
        <link href="https://fonts.googleapis.com/css2?family=MedievalSharp" rel="stylesheet"/>
        <style>
            .h1 {
                text-align: center;
            }
            .h1,
            .h2,
            .h3,
            .h4,
            .h5 {
                margin: 2em;
            }
            div.button {
                display: flex;
                justify-content: center;
                margin: 10px;
            }
            span.subtitle {
                margin: 1em;
                margin-right: 3em;
                background-color: #F0EFF0;
                color: #000000;
            }
            div.entity_block {
                margin-top: 1em;
                border: 1px solid blue;
                padding: 1em;
                border-radius: 10px;
            }
            span.colonne {
                text-align: center;
            }
            p.titre {
                color: #EF0107;
            }</style>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
            rel="stylesheet"
            integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
            crossorigin="anonymous"/>
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"/>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.3/umd/popper.min.js"/>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js"/>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"/>
    </xsl:template>

    <!--Template navbar-->
    <xsl:template name="navbar">
        <nav class="navbar navbar-expand-lg navbar-dark sticky-top"
            style="background-color: #4169E1;">
            <a class="navbar-brand" href="./homepage.html" style="margin-left: 1em;">
                <img class="d-inline-block" src="./img/brand.png" width="60" height="60" alt=""
                />Accueil</a>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mr-auto mt-2 mt-lg-0">
                    <li class="nav-item dropdown nav-item">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
                            role="button" data-toggle="dropdown" aria-haspopup="true"
                            aria-expanded="false">Editions</a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <a class="dropdown-item" href="./ms_ny.html">MS M.804</a>
                            <a class="dropdown-item" href="./ms_pa.html">Français 2663</a>
                            <a class="dropdown-item" href="./ms_cou.html">Cod. 329</a>
                        </div>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="./index.html">Index</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="./manifeste.html">Notices</a>
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
                <p class="text-light">© MIT Licence | Humeau Maxime - 2022 : <a class="text-light"
                        href="https://github.com/rayondemiel" target="_blank">Github</a></p>
            </div>
        </footer>
    </xsl:template>

    <!--###############################
    ########## TEI-HEADER ###########
    ###############################-->

    <!-- Template notice (teiHeader) manuscrit (css s'appuie sur l'édition numérique de Segolene Albouy - lien github: https://github.com/Segolene-Albouy/Segolene-Albouy.github.io -->
    <xsl:template match="witness">
        <xsl:variable name="id" select="./@xml:id"/>
        <!-- Choix pour la version active de la navtab -->
        <xsl:choose>
            <xsl:when test=".[@xml:id = 'Cou']">
                <div class="tab-pane fade show active" id="Cou" role="tabpanel">
                    <h1 class="p-3">
                        <xsl:text>Manuscrit </xsl:text>
                        <em> (<xsl:value-of
                                select="//witness[@xml:id = $id]/descendant::msIdentifier/idno"/>)
                        </em>
                    </h1>
                    <div class="row">
                        <!-- Informations générales du manuscrit -->
                        <div class="card col-md-3 col-sm-5 p-3">
                            <div id="general" class="text-center">
                                <h4>
                                    <xsl:value-of
                                        select="//witness[@xml:id = $id]/descendant::msIdentifier/institution"
                                    />
                                </h4>
                                <xsl:apply-templates
                                    select="//witness[@xml:id = $id]/descendant::msIdentifier"/>
                            </div>
                            <hr/>
                            <div id="id" class="p-1">
                                <h5>Identifiants</h5>
                                <p>
                                    <b>Cote : <xsl:value-of
                                            select="//witness[@xml:id = $id]/descendant::msIdentifier/idno"
                                        /></b>
                                </p>
                                <xsl:if test="//witness[@xml:id = $id]/descendant::altIdentifier">
                                    <xsl:apply-templates
                                        select="//witness[@xml:id = $id]/descendant::altIdentifier"
                                    />
                                </xsl:if>
                                <p>
                                    <xsl:variable name="lien">
                                        <xsl:value-of select="//witness[@xml:id = $id]/msDesc/@facs"
                                        />
                                    </xsl:variable>
                                    <a href="{$lien}" target="_blank">Lien</a>
                                </p>
                            </div>
                            <hr/>
                            <div id="summary" class="p-1">
                                <h5>Sommaire</h5>
                                <div class="container">
                                    <xsl:value-of
                                        select="//witness[@xml:id = $id]/descendant::summary"/>
                                </div>
                            </div>
                        </div>

                        <!-- Bloc description détaillé manuscrit -->
                        <div class="container col-md-8 col-sm-7">
                            <h3>
                                <xsl:value-of select="//witness[@xml:id = $id]/descendant::msName"/>
                            </h3>
                            <div class="container">
                                <p>
                                    <xsl:value-of
                                        select="//witness[@xml:id = $id]/descendant::textLang"/>
                                    <xsl:text> - </xsl:text>
                                    <b>
                                        <xsl:value-of
                                            select="//witness[@xml:id = $id]/descendant::head/origDate"
                                        />
                                    </b>
                                    <br/>
                                </p>
                                <hr/>
                                <div id="extrait" class="p-1">
                                    <h5>Extrait</h5>
                                    <div class="container">
                                        <xsl:apply-templates
                                            select="//witness[@xml:id = $id]/descendant::msItemStruct"
                                        />
                                    </div>
                                </div>
                                <hr/>
                                <div id="resp" class="p-1">
                                    <h5>Intervenants</h5>
                                    <div class="container">
                                        <xsl:apply-templates
                                            select="//witness[@xml:id = $id]/descendant::author"/>
                                    </div>
                                    <br/>
                                    <p>Manuscrit associé : <xsl:value-of
                                            select="count(//witness[@xml:id = $id]/descendant::filiation/descendant::bibl)"
                                        /></p>
                                </div>
                                <hr/>
                                <div id="physDesc" class="p-1">
                                    <h3>Description matérielle</h3>
                                    <div class="container">
                                        <b>Support</b>
                                        <xsl:value-of
                                            select="concat(' : ', //witness[@xml:id = $id]/descendant::support)"/>
                                        <br/>
                                        <b>Dimension</b>
                                        <xsl:value-of
                                            select="concat(' : largeur : ', //witness[@xml:id = $id]/descendant::extent/width, //witness[@xml:id = $id]/descendant::extent/width/@unit, ' ; longueur : ', //witness[@xml:id = $id]/descendant::extent/height, //witness[@xml:id = $id]/descendant::extent/height/@unit)"/>
                                        <br/>
                                        <b>Foliotation</b>
                                        <xsl:value-of
                                            select="concat(' : ', //witness[@xml:id = $id]/descendant::physDesc//foliation)"/>
                                        <br/>
                                        <b>Mise en page</b>
                                        <p>
                                            <xsl:apply-templates
                                                select="//witness[@xml:id = $id]/descendant::layoutDesc"
                                            />
                                        </p>
                                        <br/>
                                        <xsl:value-of
                                            select="//witness[@xml:id = $id]/descendant::physDesc//layout"/>
                                        <hr/>
                                        <b>Description des mains</b>
                                        <xsl:value-of
                                            select="concat(' : ', //witness[@xml:id = $id]//handNote)"/>
                                        <xsl:if
                                            test="//witness[@xml:id = $id]/descendant::handNote//list">
                                            <xsl:apply-templates
                                                select="//witness[@xml:id = $id]/descendant::handNote//list/item"
                                            />
                                        </xsl:if>
                                        <hr/>
                                        <b>Description de l'écriture</b>
                                        <xsl:value-of
                                            select="concat(' : ', //witness[@xml:id = $id]/descendant::scriptNote)"/>
                                        <hr/>
                                        <b>Description de l'ornement :</b>
                                        <xsl:apply-templates
                                            select="//witness[@xml:id = $id]/descendant::decoDesc"/>
                                        <hr/>
                                        <b>Description des reliures :</b>
                                        <br/>
                                        <xsl:apply-templates
                                            select="//witness[@xml:id = $id]/descendant::bindingDesc//p"/>

                                    </div>
                                    <hr/>
                                    <div id="physDesc" class="p-1">
                                        <h3>Historique</h3>
                                        <div class="container">
                                            <xsl:apply-templates
                                                select="//witness[@xml:id = $id]/descendant::history"
                                            />
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </xsl:when>
            <xsl:otherwise>
                <div class="tab-pane fade" id="{$id}" role="tabpanel" aria-labelledby="témoin">
                    <h1 class="p-3">
                        <xsl:text>Manuscrit </xsl:text>
                        <em> (<xsl:value-of
                                select="//witness[@xml:id = $id]/descendant::msIdentifier/idno"/>)
                        </em>
                    </h1>
                    <div class="row">
                        <!-- Informations générales du manuscrit -->
                        <div class="card col-md-3 col-sm-5 p-3">
                            <div id="general" class="text-center">
                                <h4>
                                    <xsl:value-of
                                        select="//witness[@xml:id = $id]/descendant::msIdentifier/institution"
                                    />
                                </h4>
                                <xsl:apply-templates
                                    select="//witness[@xml:id = $id]/descendant::msIdentifier"/>
                            </div>
                            <hr/>
                            <div id="id" class="p-1">
                                <h5>Identifiants</h5>
                                <p>
                                    <b>Cote : <xsl:value-of
                                            select="//witness[@xml:id = $id]/descendant::msIdentifier/idno"
                                        /></b>
                                </p>
                                <xsl:if test="//witness[@xml:id = $id]/descendant::altIdentifier">
                                    <xsl:apply-templates
                                        select="//witness[@xml:id = $id]/descendant::altIdentifier"
                                    />
                                </xsl:if>
                                <p>
                                    <xsl:variable name="lien">
                                        <xsl:value-of select="//witness[@xml:id = $id]/msDesc/@facs"
                                        />
                                    </xsl:variable>
                                    <a href="{$lien}" target="_blank">Lien</a>
                                </p>
                            </div>
                            <hr/>
                            <div id="summary" class="p-1">
                                <h5>Sommaire</h5>
                                <div class="container">
                                    <xsl:value-of
                                        select="//witness[@xml:id = $id]/descendant::summary"/>
                                </div>
                            </div>
                        </div>

                        <!-- Bloc description détaillé manuscrit -->
                        <div class="container col-md-8 col-sm-7">
                            <h3>
                                <xsl:value-of select="//witness[@xml:id = $id]/descendant::msName"/>
                            </h3>
                            <div class="container">
                                <p>
                                    <xsl:value-of
                                        select="//witness[@xml:id = $id]/descendant::textLang"/>
                                    <xsl:text> - </xsl:text>
                                    <b>
                                        <xsl:value-of
                                            select="//witness[@xml:id = $id]/descendant::head/origDate"
                                        />
                                    </b>
                                    <br/>
                                </p>
                                <hr/>
                                <div id="extrait" class="p-1">
                                    <h5>Extrait</h5>
                                    <div class="container">
                                        <xsl:apply-templates
                                            select="//witness[@xml:id = $id]/descendant::msItemStruct"
                                        />
                                    </div>
                                </div>
                                <hr/>
                                <div id="resp" class="p-1">
                                    <h5>Intervenants</h5>
                                    <div class="container">
                                        <xsl:apply-templates
                                            select="//witness[@xml:id = $id]/descendant::author"/>
                                    </div>
                                    <br/>
                                    <p>Manuscrit associé : <xsl:value-of
                                            select="count(//witness[@xml:id = $id]/descendant::filiation/descendant::bibl)"
                                        /></p>
                                </div>
                                <hr/>
                                <div id="physDesc" class="p-1">
                                    <h3>Description matérielle</h3>
                                    <div class="container">
                                        <b>Support</b>
                                        <xsl:value-of
                                            select="concat(' : ', //witness[@xml:id = $id]/descendant::support)"/>
                                        <br/>
                                        <b>Dimension</b>
                                        <xsl:value-of
                                            select="concat(' : largeur : ', //witness[@xml:id = $id]/descendant::extent/width, //witness[@xml:id = $id]/descendant::extent/width/@unit, ' ; longueur : ', //witness[@xml:id = $id]/descendant::extent/height, //witness[@xml:id = $id]/descendant::extent/height/@unit)"/>
                                        <br/>
                                        <b>Foliotation</b>
                                        <xsl:value-of
                                            select="concat(' : ', //witness[@xml:id = $id]/descendant::physDesc//foliation)"/>
                                        <br/>
                                        <b>Mise en page</b>
                                        <p>
                                            <xsl:apply-templates
                                                select="//witness[@xml:id = $id]/descendant::layoutDesc"
                                            />
                                        </p>
                                        <br/>
                                        <xsl:value-of
                                            select="//witness[@xml:id = $id]/descendant::physDesc//layout"/>
                                        <hr/>
                                        <b>Description des mains</b>
                                        <xsl:value-of
                                            select="concat(' : ', //witness[@xml:id = $id]//handNote)"/>
                                        <xsl:if
                                            test="//witness[@xml:id = $id]/descendant::handNote//list">
                                            <xsl:apply-templates
                                                select="//witness[@xml:id = $id]/descendant::handNote//list/item"
                                            />
                                        </xsl:if>
                                        <hr/>
                                        <b>Description de l'écriture</b>
                                        <xsl:value-of
                                            select="concat(' : ', //witness[@xml:id = $id]/descendant::scriptNote)"/>
                                        <hr/>
                                        <b>Description de l'ornement :</b>
                                        <xsl:apply-templates
                                            select="//witness[@xml:id = $id]/descendant::decoDesc"/>
                                        <hr/>
                                        <b>Description de l'ornement :</b>
                                        <br/>
                                        <xsl:apply-templates
                                            select="//witness[@xml:id = $id]/descendant::bindingDesc//p"/>

                                    </div>
                                    <hr/>
                                    <div id="physDesc" class="p-1">
                                        <h3>Historique</h3>
                                        <div class="container">
                                            <xsl:apply-templates
                                                select="//witness[@xml:id = $id]/descendant::history"
                                            />
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <xsl:template match="author">
        <xsl:value-of select="concat(./surname, ', ', ./forename)"/>
    </xsl:template>

    <!-- Block localisation -->
    <xsl:template match="msIdentifier">
        <p>
            <dl>
                <dt>Departement</dt>
                <dd>
                    <xsl:value-of select="./repository"/>
                </dd>
                <dt>Collection</dt>
                <dd>
                    <xsl:value-of select="./collection"/>
                </dd>
                <dt>Localisation</dt>
                <dd>
                    <xsl:value-of select="concat(./country, ', ', ./settlement)"/>
                </dd>
            </dl>
        </p>
    </xsl:template>

    <!-- block identifiant -->
    <xsl:template match="altIdentifier">
        <p> Ancien(s) identifiant(s) : <ul>
                <xsl:apply-templates select=".//idno"/>
            </ul>
        </p>
    </xsl:template>

    <xsl:template match="/altIdentifier//idno">
        <li>
            <xsl:value-of select="."/>
        </li>
    </xsl:template>

    <!-- Block descriptio -->

    <xsl:template match="msItemStruct">
        <p>"<i style="color: #EF0107;"><xsl:value-of select="./title"/></i>" - <xsl:value-of
                select="./locus"/>
            <dl>
                <dt>Incipit</dt><dd><i>"<xsl:value-of select="./incipit"/>"</i></dd>
                <dt>Explicit</dt><dd><i>"<xsl:value-of select="./explicit"/>"</i></dd>
            </dl>
        </p>
    </xsl:template>

    <xsl:template match="layoutDesc">
        <xsl:choose>
            <xsl:when test="count(./descendant::layout) = 2">
                <ul>
                    <li>
                        <xsl:value-of
                            select="concat('colonnes : ', ./descendant::layout[1]/@columns, ' - lignes : ', ./descendant::layout[1]/@writtenLines)"
                        />
                    </li>
                    <li>
                        <xsl:value-of
                            select="concat('colonnes : ', ./descendant::layout[2]/@columns, ' - lignes : ', ./descendant::layout[2]/@writtenLines)"
                        />
                    </li>
                </ul>
            </xsl:when>
            <xsl:otherwise>
                <p>
                    <xsl:value-of
                        select="concat('colonnes : ', ./descendant::layout/@columns, ' - lignes : ', ./descendant::layout/@writtenLines)"
                    />
                </p>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <xsl:template match="decoDesc">
        <p>
            <xsl:value-of select="./decoNote[not(@*)]"/>
        </p>
        <xsl:if test="./decoNote/@type">
            <p>
                <span class="subtitle">
                    <xsl:value-of select="./decoNote/@type"/>
                </span>
                <xsl:value-of select="./decoNote[@type]"/>
            </p>
        </xsl:if>
    </xsl:template>

    <xsl:template match="history">
        <p>
            <xsl:value-of select="concat(./origin, ' ', ./provenance/p)"/>
            <xsl:if test=".//stamp">
                <br/>
                <br/>
                <b>Liste des estampilles</b>
                <xsl:apply-templates select=".//stamp"/>
            </xsl:if>
        </p>
    </xsl:template>

    <xsl:template match="stamp">
        <xsl:variable name="id" select="./@xml:id"/>
        <p>
            <span class="subtitle">
                <xsl:value-of select="./@xml:id"/>
            </span>
            <xsl:value-of select=".[@xml:id = $id]"/>
            <dl style="margin-left : 3em;" class="row">
                <div class="col">
                    <dt>Folio</dt>
                    <dd>
                        <xsl:value-of select=".[@xml:id = $id]/descendant::bibl"/>
                    </dd>
                </div>
                <div class="col">
                    <dt>Type</dt>
                    <dd>
                        <xsl:value-of select=".[@xml:id = $id]/dim/@type"/>
                    </dd>
                </div>
                <div class="col">
                    <dt>Taille</dt>
                    <dd>
                        <xsl:value-of select=".[@xml:id = $id]/dim/@n"/>
                    </dd>
                </div>
            </dl>
        </p>
    </xsl:template>

    <!--###############################
    ############# INDEX #############
    ###############################-->

    <xsl:template name="listPlace">
        <xsl:for-each select="//listPlace/place">
            <xsl:sort select="./placeName[@type = 'contemporary-name']" order="ascending"/>
            <xsl:variable name="id" select="./@xml:id"/>
            <div class="entity_block" id="{$id}">
                <!-- Titre block -->
                <h2>
                    <xsl:value-of select="placeName[@type = 'contemporary-name']"/>
                </h2>
                <!-- Nature du lieu -->
                <p class="text-muted">
                    <xsl:value-of select="./@type"/>
                </p>
                <xsl:choose>
                    <!-- Liste des dénominations selon apparat critique -->
                    <xsl:when test="placeName[@type = 'text-name']/descendant::app">
                        <h4>Dénomination selon les témoins</h4>
                        <p>
                            <b>Témoin principal : </b>
                            <xsl:value-of select="./descendant::lem"/>
                        </p>
                        <p>
                            <b>Autres versions:</b>
                            <ul>
                                <xsl:for-each select="./descendant::rdg">
                                    <li><xsl:value-of select="."/> (<xsl:value-of
                                            select="replace(./@wit, '#', '@')"/>)</li>
                                </xsl:for-each>
                            </ul>
                        </p>
                    </xsl:when>
                    <!-- Dénomination simple -->
                    <xsl:otherwise>
                        <p>
                            <b>Dénomination : </b>
                            <xsl:value-of select="placeName[@type = 'text-name']"/>
                        </p>
                    </xsl:otherwise>
                </xsl:choose>
                <!-- Note -->
                <xsl:if test="./note">
                    <hr/>
                    <div>
                        <h4>Note</h4>
                        <xsl:apply-templates select="./note"/>
                    </div>
                </xsl:if>
                <p>
                    <i>Nombres de mentions : </i>
                    <xsl:value-of
                        select="count(ancestor::TEI//body/div//placeName[replace(@ref, '#', '') = $id])"
                    />
                </p>
            </div>
        </xsl:for-each>
    </xsl:template>

    <!-- Index des personnages -->
    <xsl:template name="listName">
        <xsl:for-each select="//particDesc/listPerson">
            <h2>
                <xsl:number count="//listPerson" format="I" level="multiple"/> - <xsl:value-of
                    select="./head"/> (<xsl:value-of select="./@type"/>) </h2>
            <xsl:apply-templates select="./person"/>
            <xsl:apply-templates select="./personGrp"/>
            <xsl:if test="./descendant::listPerson">
                <xsl:for-each select="./descendant::listPerson">
                    <h4 class="text-muted">
                        <xsl:number count="//listPerson" format="I" level="multiple"/> -
                            <xsl:value-of select="./head"/> (<xsl:value-of select="./@type"/>) </h4>
                    <xsl:apply-templates select="./person"/>
                    <xsl:apply-templates select="./personGrp"/>
                </xsl:for-each>
            </xsl:if>
        </xsl:for-each>
    </xsl:template>

    <!-- Block par personnage identifié -->
    <xsl:template match="person">
        <xsl:variable name="id" select="./@xml:id"/>
        <div class="entity_block" id="{$id}">
            <!-- Titre block -->
            <h2>
                <xsl:apply-templates select="persName[@type = 'contemporary-name']"/>
                <span style="font-size: large;">(<xsl:value-of select="birth"/> - <xsl:value-of
                        select="death"/>)</span>
            </h2>
            <!-- Nature du lieu -->
            <p class="text-muted">
                <xsl:value-of select="replace(./@role, '_', ' ')"/>
            </p>
            <h4>Dénomination selon apparat critique</h4>
            <div class="row">
                <xsl:apply-templates select="persName[@type = 'text-name']"/>
            </div>
            <!-- Note -->
            <xsl:if test="./note">
                <hr/>
                <div>
                    <h4>Note</h4>
                    <xsl:apply-templates select="./note"/>
                </div>
            </xsl:if>
            <p>
                <i>Nombres de mentions : </i>
                <xsl:value-of
                    select="count(ancestor::TEI//body/div//persName[replace(@ref, '#', '') = $id])"
                />
            </p>
        </div>
    </xsl:template>

    <xsl:template match="personGrp">
        <xsl:variable name="id" select="./@xml:id"/>
        <div class="entity_block" id="{$id}">
            <!-- Titre block -->
            <h2>
                <xsl:value-of select="./name"/>
            </h2>
            <!-- Note -->
            <xsl:if test="./note">
                <hr/>
                <div>
                    <h4>Note</h4>
                    <xsl:apply-templates select="./note"/>
                </div>
            </xsl:if>
        </div>
    </xsl:template>

    <!-- Template pour les dénominations contemporaines -->
    <xsl:template match="persName[@type = 'contemporary-name']">
        <!-- Normalisation des noms selon la présence d'un genName pour éviter les espaces -->
        <xsl:choose>
            <xsl:when test="./descendant::genName">
                <xsl:value-of
                    select="concat(./forename, ' ', ./genName, ' ', ./surname, ' ', ./addName)"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="(./forename, ' ', ./surname, ' ', ./addName)"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <!-- Template pour les dénominations au sien des témoins -->
    <xsl:template match="persName[@type = 'text-name']">
        <xsl:if test="roleName">
            <ul class="col">
                <span class="colonne">
                    <i>Titre</i>
                </span>
                <xsl:for-each select="./roleName">
                    <xsl:choose>
                        <xsl:when test="./descendant::app">
                            <xsl:for-each select="app/node()">
                                <li><xsl:value-of select="."/> (<xsl:value-of
                                        select="replace(./@wit, '#', '@')"/>)</li>
                            </xsl:for-each>
                        </xsl:when>
                        <!-- Si utilisation similaire -->
                        <xsl:otherwise>
                            <li><xsl:value-of select="."/> (@Cou @NY @Pa)</li>
                        </xsl:otherwise>
                    </xsl:choose>
                </xsl:for-each>
            </ul>
        </xsl:if>
        <xsl:if test="forename">
            <ul class="col">
                <span class="colonne">
                    <i>Prénom</i>
                </span>
                <xsl:for-each select="./forename">
                    <xsl:choose>
                        <xsl:when test="./descendant::app">
                            <xsl:for-each select="app/node()">
                                <li><xsl:value-of select="."/> (<xsl:value-of
                                        select="replace(./@wit, '#', '@')"/>)</li>
                            </xsl:for-each>
                        </xsl:when>
                        <!-- Si utilisation similaire -->
                        <xsl:otherwise>
                            <li><xsl:value-of select="."/> (@Cou @NY @Pa)</li>
                        </xsl:otherwise>
                    </xsl:choose>
                </xsl:for-each>
            </ul>
        </xsl:if>
        <xsl:if test="genName">
            <ul class="col">
                <span class="colonne">
                    <i>Nom de génération</i>
                </span>
                <xsl:for-each select="./genName">
                    <xsl:choose>
                        <xsl:when test="./descendant::app">
                            <xsl:for-each select="app/node()">
                                <li><xsl:value-of select="."/> (<xsl:value-of
                                        select="replace(./@wit, '#', '@')"/>)</li>
                            </xsl:for-each>
                        </xsl:when>
                        <xsl:otherwise>
                            <li><xsl:value-of select="."/> (@Cou @NY @Pa)</li>
                        </xsl:otherwise>
                    </xsl:choose>
                </xsl:for-each>
            </ul>
        </xsl:if>
        <xsl:if test="surname">
            <ul class="col">
                <span class="colonne">
                    <i>Nom</i>
                </span>
                <xsl:for-each select="./surname">
                    <xsl:choose>
                        <xsl:when test="./descendant::app">
                            <xsl:for-each select="app/node()">
                                <li><xsl:value-of select="."/> (<xsl:value-of
                                        select="replace(./@wit, '#', '@')"/>)</li>
                            </xsl:for-each>
                        </xsl:when>
                        <!-- Si utilisation similaire -->
                        <xsl:otherwise>
                            <li><xsl:value-of select="."/> (@Cou @NY @Pa)</li>
                        </xsl:otherwise>
                    </xsl:choose>
                </xsl:for-each>
            </ul>
        </xsl:if>
        <xsl:if test="addName">
            <ul class="col">
                <span class="colonne">
                    <i>Surnom</i>
                </span>
                <xsl:for-each select="./addName">
                    <xsl:choose>
                        <xsl:when test="./descendant::app">
                            <xsl:for-each select="app/node()">
                                <li><xsl:value-of select="."/> (<xsl:value-of
                                        select="replace(./@wit, '#', '@')"/>)</li>
                            </xsl:for-each>
                        </xsl:when>
                        <!-- Si utilisation similaire -->
                        <xsl:otherwise>
                            <li><xsl:value-of select="."/> (@Cou @NY @Pa)</li>
                        </xsl:otherwise>
                    </xsl:choose>
                </xsl:for-each>
            </ul>
        </xsl:if>
    </xsl:template>

    <!-- Template note selon la structure du conteneur-->
    <xsl:template match="note">
        <xsl:choose>
            <xsl:when test="./bibl">
                <p>
                    <xsl:value-of select="./p"/>
                </p>
                <p>
                    <b>Références : </b>
                    <xsl:value-of select="./bibl"/>
                </p>
            </xsl:when>
            <xsl:when test="./listBibl">
                <p>
                    <xsl:value-of select="./p"/>
                </p>
                <p>
                    <b>Références : </b>
                    <xsl:value-of select="./listBibl"/>
                </p>
            </xsl:when>
            <xsl:otherwise>
                <p>
                    <xsl:value-of select="."/>
                </p>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <!--###############################
    ############# TEXTE #############
    ###############################-->

    <!-- Template titre selon version -->
    <!-- NY -->
    <xsl:template match="head[@type = 'titre']" mode="titre_ny">
        <p class="titre">
            <span class="subtitle">shp :<xsl:value-of select="ancestor::div[@type = 'section']/@n"
                /></span>
            <xsl:apply-templates select="descendant::lem | persName | date | placeName"/>
        </p>
    </xsl:template>
    <!-- Pa -->
    <xsl:template match="head[@type = 'titre']" mode="titre_pa">
        <p class="titre">
            <span class="subtitle">shp :<xsl:value-of select="ancestor::div[@type = 'section']/@n"
                /></span>
            <xsl:apply-templates
                select="text() | descendant::hi | persName | date | placeName | descendant::lem[contains(@wit, 'Pa')] | descendant::rdg[contains(@wit, 'Pa')]"
            />
        </p>
    </xsl:template>
    <!-- Cou -->
    <xsl:template match="head[@type = 'titre']" mode="titre_cou">
        <p class="titre">
            <span class="subtitle">shp :<xsl:value-of select="ancestor::div[@type = 'section']/@n"
                /></span>
            <xsl:apply-templates
                select="text() | descendant::hi | persName | date | placeName | descendant::lem[contains(@wit, 'Cou')] | descendant::rdg[contains(@wit, 'Cou')]"
            />
        </p>
    </xsl:template>

    <!-- Template texte selon version -->
    <!-- NY -->
    <xsl:template match="//div[@type = 'section']/p" mode="text_ny">
        <p class="para"> [<xsl:value-of select="@n"/>] <xsl:apply-templates
                select="text() | persName | date | placeName | descendant::lem"/>
        </p>
    </xsl:template>
    <!-- Pa -->
    <xsl:template match="//div[@type = 'section']/p" mode="text_pa">
        <p class="para"> [<xsl:value-of select="@n"/>] <xsl:apply-templates
                select="text() | rdg[@wit = 'Pa']/descendant::lb | persName | date | placeName | descendant::lem[contains(@wit, 'Pa')] | descendant::rdg[contains(@wit, 'Pa')] | descendant::rdg[contains(@wit, 'Pa')]"
            />
        </p>
    </xsl:template>
    <!-- Cou -->
    <xsl:template match="//div[@type = 'section']/p" mode="text_cou">
        <p class="para"> [<xsl:value-of select="@n"/>] <xsl:apply-templates
                select="text() | rdg[@wit = 'Cou']/descendant::lb | persName | date | placeName | descendant::lem[contains(@wit, 'Cou')] | descendant::rdg[contains(@wit, 'Cou')]"
            />
        </p>
    </xsl:template>

    <!--Tooltip notice Index dans texte édité-->
    <!-- notice persname -->
    <xsl:template match="body/descendant::persName">
        <xsl:variable name="idwit" select="replace(@ref, '#', '')"/>
        <xsl:choose>
            <xsl:when test="@ref">
                <xsl:variable name="id" select="replace(@ref, '#', '')"/>
                <xsl:variable name="note" select="concat(//person[@xml:id=$id]/persName[@type='contemporary-name']/forename, ', ', //person[@xml:id=$id]/persName[@type='contemporary-name']/genName, ', ', //person[@xml:id=$id]/persName[@type='contemporary-name']/surname, ', ', //person[@xml:id=$id]/persName[@type='contemporary-name']/addName, ' | role : ', replace(//person[@xml:id=$id]/@role, '_', ' '))"/>
                <xsl:choose>
                    <xsl:when test="choice">
                        <del><xsl:value-of select="choice/orig"/></del>
                        <a href="./index.html" title="{$note}"><xsl:value-of select="choice/reg"/></a>
                    </xsl:when>
                    <xsl:otherwise>
                        <a href="./index.html" title="{$note}"><xsl:value-of select="."/></a>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:when>
            <!--affiche les autres noms-->
            <xsl:otherwise>
                <span>
                    <xsl:value-of select="node()"/>
                </span>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    <!-- notice placename -->
    <xsl:template match="body/descendant::placeName">
        <xsl:choose>
            <xsl:when test="@ref">
                <xsl:variable name="id" select="replace(@ref, '#', '')"/>
                <xsl:variable name="note" select="concat(//place[@xml:id=$id]/placeName[@type='contemporary-name'], ' | role : ', //place[@xml:id=$id]/@type)"/>
                <xsl:choose>
                    <xsl:when test="choice">
                        <del><xsl:value-of select="choice/orig"/></del>
                        <a href="./index.html" title="{$note}"><xsl:value-of select="choice/reg"/></a>
                    </xsl:when>
                    <xsl:otherwise>
                        <a href="./index.html" title="{$note}"><xsl:value-of select="."/></a>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:when>
            <!--affiche les autres noms-->
            <xsl:otherwise>
                <span>
                    <xsl:value-of select="node()"/>
                </span>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <!-- Colorisation des Lettrines -->
    <xsl:template match="hi">
        <span style="color: #EF0107;">
            <xsl:value-of select="."/>
        </span>
    </xsl:template>

    <!-- Saut de ligne -->
    <xsl:template match="lb">
        <br/>
        <br/>
    </xsl:template>

    <xsl:template match="choice">
        <del>
            <xsl:value-of select="orig"/>
        </del>
        <span> [<xsl:value-of select="reg"/>]</span>
    </xsl:template>

</xsl:stylesheet>