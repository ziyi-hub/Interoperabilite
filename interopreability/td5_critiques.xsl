<?xml version='1.0'?>
<xsl:stylesheet
        xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version='1.0'>

    <xsl:output method="html" indent="yes"/>

    <xsl:template match="/">
        <html><head><title>Visualisation</title></head>
            <body>
                <xsl:for-each select="FILMS/Film">
                    <h1><xsl:value-of select="Titre"/></h1>
                    <h3>
                        <xsl:value-of select="Critique/Media"/>
                        (<xsl:value-of select="Critique/Auteur"/>)
                    </h3>
                    <xsl:value-of select="Critique[1]/Texte"/>
                    <br></br>
                    <br></br>
                    <h3>
                        <xsl:value-of select="Critique[2]/Media"/>
                        (<xsl:value-of select="Critique[2]/Auteur"/>)
                    </h3>
                    <xsl:value-of select="Critique[2]/Texte"/>
                    <br></br>
                    <br></br>
                </xsl:for-each>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>