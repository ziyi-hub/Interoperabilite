<?xml version='1.0' encoding="UTF-8" ?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version='1.0'>
    <xsl:output method="xml" indent="yes"/>
    <xsl:strip-space elements="*"/>

    <xsl:template match="/">
        <PARKING>
            <carto>
                <markers>
                    <xsl:apply-templates select="PARKING/carto/markers/marker"/>
                </markers>
            </carto>
        </PARKING>
    </xsl:template>

    <xsl:template match="carto/markers/marker">
        <marker>
            <xsl:attribute name="name">
                <xsl:value-of select="@name"/>
            </xsl:attribute>
            <xsl:attribute name="number">
                <xsl:value-of select="@number"/>
            </xsl:attribute>
            <xsl:attribute name="address">
                <xsl:value-of select="@address"/>
            </xsl:attribute>
            <xsl:attribute name="lat">
                <xsl:value-of select="@lat"/>
            </xsl:attribute>
            <xsl:attribute name="lng">
                <xsl:value-of select="@lng"/>
            </xsl:attribute>

            <xsl:attribute name="available">
                <xsl:value-of select="../../stations/station[@ID=current()/@number]/available"/>
            </xsl:attribute>
            <xsl:attribute name="free">
                <xsl:value-of select="../../stations/station[@ID=current()/@number]/free"/>
            </xsl:attribute>
            <xsl:attribute name="total">
                <xsl:value-of select="../../stations/station[@ID=current()/@number]/total"/>
            </xsl:attribute>

        </marker>
    </xsl:template>



</xsl:stylesheet>