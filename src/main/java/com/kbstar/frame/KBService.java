package com.kbstar.frame;

import org.springframework.transaction.annotation.Transactional;

import java.util.List;

public interface KBService<K, V> {

    /**
     * 등록 및 가입 진행
     * argument: Object
     * retunr:null
     */

    @Transactional
    //이렇게 처리된 트랜잭션은 성공적으로 완료될 경우에는 데이터베이스에 적용되고, 그렇지 않을 경우에는 이전 상태로 롤백(rollback)됩니다.
    public void register(V v) throws Exception;
    public void remove(K k) throws Exception;
    public void modify(V v) throws Exception;
    public V get(K k) throws Exception;
    public List<V> get() throws Exception;

}
