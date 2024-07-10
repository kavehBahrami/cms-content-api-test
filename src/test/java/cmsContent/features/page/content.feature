Feature: sample karate test script
  for help, see: https://github.com/karatelabs/karate/wiki/IDE-Support

  Background:
    * url 'http://atc4-pdapp02.qm.pirobase.de:8080/pb/site/base_jsonInterface/jsoninterface'

  Scenario:  Get meta information of content by id
    Given path 'page'
    And path '4622819'
    And param onlyVisible = 'true'
    And param includeContent = 'true'
    And param includeProperties = 'false'
    And param includeStandardProperties = 'false'
    And param disableTargeting = 'false'
    And param argetingGroups = ''
    When method get
    Then status 200

    * def locale = response.page.locale
    Then match locale == "de"

    When def contentId = []
    And eval for (var i=0; i<response.page.content[0].content.length;i++)  contentId.push(response.page.content[0].content[i].id);
    Then print response.page.content[0].content
    And print contentId

  Scenario:  The http status code will be 404 if the content id is unknown
    Given path 'page'
    And path '0000009'
    And param onlyVisible = 'true'
    And param includeContent = 'true'
    And param includeProperties = 'false'
    And param includeStandardProperties = 'false'
    And param disableTargeting = 'false'
    And param argetingGroups = ''
    When method get
    Then status 404