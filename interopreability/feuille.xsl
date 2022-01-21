<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="text" encoding="UTF-8" indent="yes"/>
    <!--  On démarre le parcours de l'arbre xml de la racine  -->
    <xsl:template match="/">
        <!--  On parcourt le sous-arbre dans l'ordre 'normal'  -->
        <xsl:apply-templates/>
    </xsl:template>
</xsl:stylesheet>