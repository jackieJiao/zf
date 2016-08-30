/**
 * Created by yuanshuai5 on 2016/8/12.
 */

function first() {
    page.pageNow = 1;
    search();
}

function last() {
    page.pageNow = page.totalPageCount;
    search();
}

function next() {
    page.pageNow = page.pageNow + 1;
    search();
}

function prev() {
    page.pageNow = page.pageNow - 1;
    search();
}


