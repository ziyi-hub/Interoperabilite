<?xml version='1.0'?>
<xsl:stylesheet
        xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version='1.0'>

    <xsl:output method="html" indent="yes"/>

    <xsl:template match="/">
        <html><head><title>Visualisation</title></head>
            <body>
                <h2> Liste des films de ma base</h2>
                    <ul>
                        <xsl:apply-templates/>
                    </ul>
            </body>
        </html>
    </xsl:template>

    <xsl:template match="FILMS/Film">
        <li>
            <xsl:value-of select="Titre"/>
        </li>
    </xsl:template>

</xsl:stylesheet>
<!-- XSLTPROC -o film.html td4_film.xsl film.xml -->