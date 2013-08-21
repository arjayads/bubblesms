/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package sms.domains;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;

/**
 *
 * @author aadong
 */
public class RssFeed {

    private Collection items = new ArrayList();

    public void addItem(RssItem item) {
        items.add(item);
    }

    public Collection getItems() {
        return Collections.unmodifiableCollection(items);
    }
}
