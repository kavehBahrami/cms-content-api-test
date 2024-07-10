package cmsContent.features;

import com.intuit.karate.junit5.Karate;

class CmsContentRunner {
    
    @Karate.Test
    Karate content() {
        return Karate.run("page/content").relativeTo(getClass());
    }

}
