<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:template match="/">
    <html> 
    <body>
      <H3>Введенное значение m: <xsl:value-of select="hash/qestion-m"/> </H3>
      <H3>Решение:</H3>
      <table border="1" >
        <tr bgcolor="#9acd32">
          <th> № </th>
          <th> Ответ </th>
          <th> дв. ответ </th>
          <th> дв. m </th>
        </tr>
        <xsl:for-each select="hash/temp-arr/temp-arr">
          <xsl:variable name="levelCount" select="position()"/>
          <tr>
            <td><xsl:value-of select="$levelCount" /></td>
            <td><xsl:value-of select="temp-arr[1]"/></td>
            <td><xsl:value-of select="temp-arr[2]"/></td>
            <td><xsl:value-of select="temp-arr[3]"/></td>
    
          </tr>
        </xsl:for-each>
      </table>
      <p>m в двоичной форме: <xsl:value-of select="hash/bin-m"/> </p>
      <p>Ответ: <xsl:value-of select="hash/ans"/>  В двоичной форме: <xsl:value-of select="hash/bin-ans"/></p>
    </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
