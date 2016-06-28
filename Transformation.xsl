<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:param name="Repertoire" />
<xsl:param name="ClasseDeLot" />
<xsl:param name="Formulaire" />
<xsl:param name="BoiteArchive" />

<xsl:template match="Batch">
	<ImportSession>
	<Fichiers>
		<Fichier>
		<xsl:attribute name="Name">
    		<xsl:value-of select="@BatchName"/>
		</xsl:attribute>
		<xsl:for-each select="/Batch/Children/L6Node/Children/L5Node/Children/L4Node/Children/L3Node/Children/L2Node/Children/L1Node/Children/Page">
			<BatchField>
				<xsl:attribute name="PrintLine">
				<xsl:for-each select="./Indexes/Index">
						<xsl:if test="./@Name='PrintLine'">
							<xsl:value-of select="./@Value"/>
						 </xsl:if>
				</xsl:for-each>
				</xsl:attribute>
				<xsl:attribute name="BoiteArchive">
				<xsl:for-each select="/Batch/Indexes/Index">
					<xsl:if test="./@Name='Container'">
						<xsl:value-of select="./@Value"/>-</xsl:if>
					<xsl:if test="./@Name='Boite'">
						<xsl:value-of select="./@Value"/>
					</xsl:if>
				</xsl:for-each>
				</xsl:attribute>
			</BatchField>
		</xsl:for-each>			
			<BatchField>
				<xsl:attribute name="Name">DateScan</xsl:attribute>
				<xsl:attribute name="Value">
					<xsl:for-each select="/Batch/Indexes/Index">
						<xsl:if test="./@Name='Timestamp'">				
							<xsl:value-of select="./substring(@Value,0,11)"/>
						</xsl:if>
					</xsl:for-each>	
				</xsl:attribute>
			</BatchField>
		</Fichier>
		</Fichiers>
	</ImportSession>
	
</xsl:template>
 
 </xsl:stylesheet>